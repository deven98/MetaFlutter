import 'package:flutter/material.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';

class TreeScreen extends StatefulWidget {
  final ModelWidget rootWidget;

  const TreeScreen({Key key, this.rootWidget}) : super(key: key);

  @override
  _TreeScreenState createState() => _TreeScreenState();
}

class _TreeScreenState extends State<TreeScreen> {
  List<List<ModelWidget>> widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widgets = List.generate(100, (v) => null);
    widgets[0] = [widget.rootWidget];
    widgets[1] = widget.rootWidget.children.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Tree"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widgets.length,
      itemBuilder: (context, position) {
        if(widgets[position] == null) {
          return Container();
        }
        return Container(
          width: 120.0,
          child: ListView(
            children: widgets[position].map((widget) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Chip(
                    label: Text(widget.widgetType.toString().split(".")[1]),
                  ),
                  onTap: () {
                    widgets[position + 1] = null;

                    setState(() {
                      widgets[position + 1] = widget.children.values.toList();
                    });
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
