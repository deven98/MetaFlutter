import 'package:flutter/material.dart';
import 'package:flutter_app_builder/pages/result_screen.dart';
import 'package:flutter_app_builder/pages/select_widget_dialog.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/center_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/column_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/text_model.dart';

class WidgetStructurePage extends StatefulWidget {
  /// The top-most node for the page
  final ModelWidget root;

  final ModelWidget currentNode;

  /// Denotes if the node in consideration is the root node of the entire widget model tree

  WidgetStructurePage(this.root, this.currentNode);

  @override
  _WidgetStructurePageState createState() => _WidgetStructurePageState();
}

class _WidgetStructurePageState extends State<WidgetStructurePage> {
  ModelWidget root;
  ModelWidget currNode;

  @override
  void initState() {
    super.initState();
    root = widget.root;
    currNode = widget.currentNode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                    root.toWidget(),
                  ),
            ),
          );
        },
        label: Text("Build Layout"),
        icon: Icon(Icons.done),
      ),
      body: currNode == null
          ? _buildAddWidgetPage()
          : CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Text("Build It!"),
                ),
                _buildInfo(),
                currNode.hasChildren ? _buildChildren() : SliverFillRemaining(),
              ],
            ),
    );
  }

  Widget _buildAddWidgetPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("No widget added yet"),
          SizedBox(
            height: 20.0,
          ),
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            color: Colors.black45,
            onPressed: () async {
              ModelWidget newWidget = await Navigator.of(context)
                  .push(new MaterialPageRoute<ModelWidget>(
                      builder: (BuildContext context) {
                        return new SelectWidgetDialog();
                      },
                      fullscreenDialog: true));
              setState(() {
                if (widget.root == null) {
                  root = newWidget;
                  currNode = root;
                } else {
                  currNode.addChild(newWidget);
                }
              });
            },
            iconSize: 60.0,
          ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Widget: " + currNode.widgetType.toString().split(".")[1]),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: currNode.hasProperties ? Text("Attributes:") : Container(),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: currNode.hasProperties ? _getAttributes(currNode) : Container(),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: currNode.hasChildren ? Text("Children:") : Container(),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: currNode.hasChildren
            ? IconButton(
                icon: Icon(Icons.add_circle_outline),
                color: Colors.black45,
                onPressed: () async {
                  ModelWidget widget = await Navigator.of(context)
                      .push(new MaterialPageRoute<ModelWidget>(
                          builder: (BuildContext context) {
                            return new SelectWidgetDialog();
                          },
                          fullscreenDialog: true));
                  setState(() {
                    currNode.addChild(widget);
                  });
                },
                iconSize: 60.0,
              )
            : Container(),
      ),
    ]));
  }

  Widget _buildChildren() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, position) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WidgetStructurePage(
                          widget.root, currNode.children[position])));
            },
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text(currNode.children[position].widgetType.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _getAttributes(currNode.children[position]),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WidgetStructurePage(
                                  root,
                                  currNode.children[position],
                                )));
                  },
                  child: Text(
                    "Expand",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                )
              ],
            ),
          ),
        );
      }, childCount: currNode.children.length),
    );
  }

  Widget _getAttributes(ModelWidget widget) {
    Map map = widget.getParamValuesMap();
    return Column(
      children: map.entries.map((entry) {
        return Row(
          children: <Widget>[
            Expanded(
              child: Text(entry.key),
              flex: 3,
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Property(widget.paramNameAndTypes[entry.key], (value) {
                  setState(() {
                    widget.params[entry.key] = value;
                  });
                }, currentValue: map[entry.key]),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
