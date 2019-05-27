import 'package:flutter/material.dart';
import 'package:flutter_app_builder/pages/add_property_widget_dialog.dart';

import 'model_widget.dart';
import 'property_helpers/icons_helper.dart';
import 'property_helpers/colors_helper.dart';
import 'property_helpers/alignment_helper.dart';

/// Types of properties of a widget
enum PropertyType {
  icon,
  double,
  integer,
  string,
  mainAxisAlignment,
  crossAxisAlignment,
  widget,
  color,
  alignment,
  boxFit,
  boolean,
}

/// The property widget displays an input widget for a certain type of property
/// For the [PropertyType.widget], it displays a button which allows the user to create a separate widget
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
        return DropdownButton(
          items: icons.map((data) {
            return DropdownMenuItem(
              child: Text(data.name),
              value: data.iconData,
            );
          }).toList(),
          onChanged: (value) {
            widget.onValueChanged(value);
          },
          value: widget.currentValue,
          isExpanded: true,
        );
        break;
      case PropertyType.double:
        return TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Enter a decimal number",
          ),
          controller:
              TextEditingController(text: widget.currentValue.toString()),
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
          controller:
              TextEditingController(text: widget.currentValue.toString()),
          keyboardType:
              TextInputType.numberWithOptions(signed: true, decimal: false),
        );
        break;
      case PropertyType.string:
        return TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: "Enter a string"),
          controller:
              TextEditingController(text: widget.currentValue.toString()),
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
                      return new AddPropertyWidgetDialog(
                        widget: getNewModelFromType(widget.widgetType),
                      );
                    },
                    fullscreenDialog: true));
            widget.onValueChanged(newWidget);
          },
          child: Text("Edit property"),
        );
        break;
      case PropertyType.color:
        return DropdownButton(
          items: colors.map(
            (value) {
              return DropdownMenuItem(
                child: Text(value.name),
                value: value.color,
              );
            },
          ).toList(),
          onChanged: widget.onValueChanged,
          value: widget.currentValue,
          isExpanded: true,
        );
        break;
      case PropertyType.alignment:
        return DropdownButton(
          items: alignments.map(
            (value) {
              return DropdownMenuItem(
                child: Text(value.name),
                value: value.alignment,
              );
            },
          ).toList(),
          onChanged: widget.onValueChanged,
          value: widget.currentValue,
          isExpanded: true,
        );
        break;
      case PropertyType.boxFit:
        return DropdownButton(
          items: BoxFit.values.map(
                (value) {
              return DropdownMenuItem(
                child: Text(value.toString()),
                value: value,
              );
            },
          ).toList(),
          onChanged: widget.onValueChanged,
          value: widget.currentValue,
          isExpanded: true,
        );
        break;
      case PropertyType.boolean:
        return DropdownButton(
          items: [true,false].map(
                (value) {
              return DropdownMenuItem(
                child: Text(value.toString()),
                value: value,
              );
            },
          ).toList(),
          onChanged: widget.onValueChanged,
          value: widget.currentValue,
          isExpanded: true,
        );
        break;
      default:
        return null;
    }
  }
}
