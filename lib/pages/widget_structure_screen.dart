import 'package:flutter/material.dart';
import 'package:flutter_app_builder/pages/result_screen.dart';
import 'package:flutter_app_builder/pages/select_widget_dialog.dart';
import 'package:flutter_app_builder/pages/tree_screen.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property.dart';

class WidgetStructurePage extends StatefulWidget {
  WidgetStructurePage();

  @override
  _WidgetStructurePageState createState() => _WidgetStructurePageState();
}

class _WidgetStructurePageState extends State<WidgetStructurePage> {
  ModelWidget root;
  ModelWidget currNode;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        label: Text("Build"),
        icon: Icon(Icons.done),
      ),
      body: currNode == null
          ? _buildAddWidgetPage()
          : CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Text("Build It!"),
                  floating: true,
                  actions: <Widget>[
                    currNode != root
                        ? IconButton(
                            icon: Icon(Icons.arrow_upward),
                            onPressed: () {
                              setState(() {
                                if (currNode.parent != null) {
                                  currNode = currNode.parent;
                                } else {
                                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                                      content: Text(
                                          "Already at the top-most widget!")));
                                }
                              });
                            },
                            padding: EdgeInsets.all(8.0),
                          )
                        : Container(),
                    IconButton(
                      icon: Icon(Icons.device_hub),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TreeScreen(
                                      rootWidget: root,
                                    )));
                      },
                      padding: EdgeInsets.all(8.0),
                    )
                  ],
                ),
                _buildInfo(),
                currNode.hasChildren ? _buildChildren() : SliverFillRemaining(),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 80.0,
                  ),
                ),
              ],
            ),
      resizeToAvoidBottomInset: true,
    );
  }

  Widget _buildAddWidgetPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "No widget added yet",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("Click here to add one"),
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
                if (root == null) {
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
            padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 4.0),
            child: currNode.parent != null ? Text("Parent: " + currNode.parent.widgetType.toString().split(".")[1]) : Container(),
          ),
      ExpansionTile(
        initiallyExpanded: currNode.hasChildren ? false : true,
        title: Text(currNode.widgetType.toString().split(".")[1]),
        children: <Widget>[
          if (currNode.hasProperties)
            Container()
          else
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "No properties for this widget",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                currNode.hasProperties ? _getAttributes(currNode) : Container(),
          ),
        ],
      ),
      currNode.hasChildren ?
      ListTile(
        title: Text(
          "Children",
          textAlign: TextAlign.center,
        ),
        trailing: Icon(Icons.add),
        onTap: () async {
          ModelWidget widget = await Navigator.of(context)
              .push(new MaterialPageRoute<ModelWidget>(
                  builder: (BuildContext context) {
                    return new SelectWidgetDialog();
                  },
                  fullscreenDialog: true));
          setState(() {
            if (widget != null) {
              widget.parent = currNode;
              currNode.addChild(widget);
            }
          });
        },
      ) : Container(),
    ]));
  }

  Widget _buildChildren() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, position) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            child: ExpansionTile(
              title: Text(currNode.children[position].widgetType.toString()),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WidgetStructurePage()));
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _getAttributes(currNode.children[position]),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            currNode = currNode.children[position];
                          });
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
              child: Text(
                entry.key,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              flex: 3,
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
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
