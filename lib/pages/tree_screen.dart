import 'package:flutter/material.dart';
import 'package:flutter_app_builder/pages/widget_structure_screen.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';

class TreeScreen extends StatefulWidget {
  final ModelWidget rootWidget;

  const TreeScreen({Key key, this.rootWidget}) : super(key: key);

  @override
  _TreeScreenState createState() => _TreeScreenState();
}

class _TreeScreenState extends State<TreeScreen> {
  List<List<ModelWidget>> widgets = [];
  List<int> selectedIndex = [];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
    );
  }

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
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text("Go to this widget"),
                          action: SnackBarAction(
                            label: "Go",
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WidgetStructureScreen(
                                        root: this.widget.rootWidget,
                                        currNode: widget,
                                      ),
                                ),
                                (val) => false,
                              );
                            },
                          ),
                        ),
                      );
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
