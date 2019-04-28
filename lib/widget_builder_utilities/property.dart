import 'package:flutter/material.dart';
import 'package:flutter_app_builder/pages/add_property_widget_dialog.dart';

import 'model_widget.dart';

enum PropertyType {
  icon,
  double,
  integer,
  string,
  mainAxisAlignment,
  crossAxisAlignment,
  widget,
}

class Property extends StatefulWidget {
  final PropertyType type;
  final ValueChanged onValueChanged;
  final currentValue;
  final WidgetType widgetType;

  Property(this.type, this.onValueChanged,
      {this.currentValue, this.widgetType});

  @override
  _PropertyState createState() => _PropertyState();
}

class _PropertyState extends State<Property> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case PropertyType.icon:
        /*return DropdownButton(items: , onChanged: (value) {
            widget.onValueChanged(value);
          });*/
        throw Exception("Icon not implemented yet");
        break;
      case PropertyType.double:
        return TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Enter a decimal number",
          ),
          onChanged: widget.onValueChanged,
          keyboardType:
              TextInputType.numberWithOptions(signed: true, decimal: true),
        );
        break;
      case PropertyType.integer:
        return TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: "Enter an integer"),
          onChanged: widget.onValueChanged,
          keyboardType:
              TextInputType.numberWithOptions(signed: true, decimal: false),
        );
        break;
      case PropertyType.string:
        return TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: "Enter a string"),
          onChanged: widget.onValueChanged,
        );
        break;
      case PropertyType.mainAxisAlignment:
        return DropdownButton(
          items: MainAxisAlignment.values.map(
            (value) {
              return DropdownMenuItem(
                child: Text(value.toString().split(".")[1]),
                value: value,
              );
            },
          ).toList(),
          onChanged: widget.onValueChanged,
          value: widget.currentValue,
          isExpanded: true,
        );
        break;
      case PropertyType.crossAxisAlignment:
        return DropdownButton(
          items: CrossAxisAlignment.values.map(
            (value) {
              return DropdownMenuItem(
                child: Text(value.toString().split(".")[1]),
                value: value,
              );
            },
          ).toList(),
          onChanged: widget.onValueChanged,
          value: widget.currentValue,
          isExpanded: true,
        );
        break;
      case PropertyType.widget:
        return FlatButton(
          onPressed: () async {
            ModelWidget newWidget = await Navigator.of(context)
                .push(new MaterialPageRoute<ModelWidget>(
                builder: (BuildContext context) {
                  return new AddPropertyWidgetDialog();
                },
                fullscreenDialog: true));
            widget.onValueChanged(newWidget);
          },
          child: Text("Edit property"),
        );
        break;
      default:
        return null;
    }
  }
}
