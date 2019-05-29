import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/color_utils.dart';
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
          ColorPair pair = getColorPair(getNewModelFromType(WidgetType.values[position]));

          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              color: pair.backgroundColor,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context,
                      getNewModelFromType(WidgetType.values[position]));
                },
                child: Center(
                  child: Text(
                    WidgetType.values[position].toString().split(".")[1],
                    style: TextStyle(
                        color: pair.textColor,
                        fontWeight: FontWeight.w500),
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
