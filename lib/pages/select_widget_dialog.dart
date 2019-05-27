import 'package:flutter/material.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';

class SelectWidgetDialog extends StatefulWidget {
  @override
  _SelectWidgetDialogState createState() => _SelectWidgetDialogState();
}

class _SelectWidgetDialogState extends State<SelectWidgetDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Widget"),
      ),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return ListTile(
            title: Text(WidgetType.values[position].toString().split(".")[1]),
            onTap: () {
              Navigator.pop(
                  context, getNewModelFromType(WidgetType.values[position]));
            },
          );
        },
        itemCount: WidgetType.values.length,
      ),
    );
  }
}
