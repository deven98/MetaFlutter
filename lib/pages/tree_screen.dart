import 'package:flutter/material.dart';
import 'package:flutter_app_builder/pages/widget_structure_screen.dart';
import 'package:flutter_app_builder/utils/color_utils.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';

/// Displays the widget tree of the current selection of widgets of the user
class TreeScreen extends StatefulWidget {
  /// Root widget of the tree
  final ModelWidget rootWidget;

  const TreeScreen({Key key, this.rootWidget}) : super(key: key);

  @override
  _TreeScreenState createState() => _TreeScreenState();
}

class _TreeScreenState extends State<TreeScreen> {
  /// Stores a list of widgets at every level
  List<List<ModelWidget>> widgets = [];

  /// Stores selected widget index at every node of the tree
  List<int> selectedIndex = [];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  ModelWidget _selectedWidget;

  @override
  void initState() {
    super.initState();
    widgets = List.generate(100, (v) => null);
    widgets[0] = [widget.rootWidget];
    widgets[1] = widget.rootWidget.children.values.toList();
    selectedIndex = List.generate(100, (v) => -1);
    selectedIndex[0] = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Widget Tree"),
      ),
      body: _buildBody(),
      bottomNavigationBar: _selectedWidget != null
          ? BottomAppBar(
              child: ListTile(
                title: Text("Click here to navigate to widget"),
                trailing: InkWell(
                  child: Text(
                    "Go",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WidgetStructureScreen(
                              root: this.widget.rootWidget,
                              currNode: _selectedWidget,
                            ),
                      ),
                      (val) => false,
                    );
                  },
                ),
              ),
            )
          : Container(
              height: 0.0,
            ),
    );
  }

  /// Builds widget tree
  Widget _buildBody() {
    return ListView.separated(
      separatorBuilder: (context, position) {
        return widgets[position] != null
            ? Container(
                color: Colors.black54,
                width: 0.5,
              )
            : Container(
                color: Colors.transparent,
                width: 0.5,
              );
      },
      scrollDirection: Axis.horizontal,
      itemCount: widgets.length,
      itemBuilder: (context, position) {
        if (widgets[position] == null) {
          return Container();
        }
        return Container(
          width: 120.0,
          child: ListView(
            children: widgets[position].map((widget) {
              return Row(
                children: <Widget>[
                  Expanded(
                      child: Divider(
                    color: Colors.black54,
                  )),
                  InkWell(
                    child: Chip(
                      label: Text(widget.widgetType.toString().split(".")[1]),
                      backgroundColor: getColorPair(widget).backgroundColor,
                    ),
                    onTap: () {
                      widgets[position + 1] = null;
                      widgets.replaceRange(
                          position + 1,
                          widgets.length,
                          List.generate(
                              widgets.length - position + 1, (v) => null));
                      selectedIndex[position] =
                          widgets[position].indexOf(widget);
                      setState(() {
                        widgets[position + 1] = widget.children.values.toList();
                      });
                      setState(() {
                        _selectedWidget = widget;
                      });
                    },
                  ),
                  Expanded(
                    child: Divider(
                      color: selectedIndex[position] ==
                              widgets[position].indexOf(widget)
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
