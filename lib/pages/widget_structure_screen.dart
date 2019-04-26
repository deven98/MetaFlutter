import 'package:flutter/material.dart';
import 'package:flutter_app_builder/models/widget_structure_model.dart';
import 'package:flutter_app_builder/pages/result_screen.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/center_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/column_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/text_model.dart';
import 'package:scoped_model/scoped_model.dart';

class WidgetStructurePage extends StatefulWidget {

  /// The top-most node for this particular page
  final ModelWidget root;

  /// Denotes if the node in consideration is the root node of the entire widget model tree
  final bool isTopNode;

  WidgetStructurePage(this.root, this.isTopNode);

  @override
  _WidgetStructurePageState createState() => _WidgetStructurePageState();
}

class _WidgetStructurePageState extends State<WidgetStructurePage> {
  ModelWidget root;

  @override
  void initState() {
    super.initState();
    root = widget.root;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<WidgetStructureModel>(
      builder:
          (BuildContext context, Widget child, WidgetStructureModel model) {
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
            label: Text("Done"),
            icon: Icon(Icons.done),
          ),
          body: root == null
              ? _buildAddWidgetPage()
              : CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      title: Text("Build It!"),
                    ),
                    _buildInfo(),
                    root.hasChildren ? _buildChildren() : SliverFillRemaining(),
                  ],
                ),
        );
      },
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
            onPressed: () {},
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
        child: Text("Widget: " + root.widgetType.toString().split(".")[1]),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: root.hasAttributes ? Text("Attributes:") : Container(),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: root.hasAttributes ? _getAttributes(root) : Container(),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: root.hasChildren ? Text("Children:") : Container(),
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
                      builder: (context) =>
                          WidgetStructurePage(root.children[position], false)));
            },
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(root.children[position].widgetType.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _getAttributes(root.children[position]),
                ),
              ],
            ),
          ),
        );
      }, childCount: root.children.length),
    );
  }

  Widget _getAttributes(ModelWidget widget) {
    Map map = widget.getParamValuesMap();
    return Column(
      children: map.entries.map((entry) {
        return Text(
          entry.key.toString() + ": " + entry.value.toString(),
        );
      }).toList(),
    );
  }
}
