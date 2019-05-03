import 'package:flutter/material.dart';
import 'package:flutter_app_builder/pages/select_widget_dialog.dart';
import 'package:flutter_app_builder/pages/widget_structure_screen.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property.dart';

/// This page is opened when a widget is to be added a property of another widget and not a child
class AddPropertyWidgetDialog extends StatefulWidget {
  final ModelWidget widget;

  const AddPropertyWidgetDialog({Key key, this.widget}) : super(key: key);

  @override
  _AddPropertyWidgetDialogState createState() =>
      _AddPropertyWidgetDialogState();
}

class _AddPropertyWidgetDialogState extends State<AddPropertyWidgetDialog> {
  ModelWidget currNode;

  @override
  void initState() {
    super.initState();
    currNode = widget.widget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add widget as property"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context, currNode);
        },
        label: Text("Add"),
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
                          currNode, currNode.children[position])));
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
                                  currNode,
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
                currNode.addChild(newWidget);
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
