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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2.0),
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              elevation: 2.0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(
                      context, getNewModelFromType(WidgetType.values[position]));
                },
                child: Center(
                  child: Text(
                    WidgetType.values[position].toString().split(".")[1],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: WidgetType.values.length,
      ),
    );
  }
}
