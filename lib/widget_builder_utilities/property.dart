import 'package:flutter/material.dart';
import 'package:flutter_app_builder/components/selecting_text_editing_controller.dart';
import 'package:flutter_app_builder/pages/add_property_widget_dialog.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property_helpers/font_style_helper.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property_helpers/scroll_physics_helper.dart';

import 'model_widget.dart';
import 'property_helpers/alignment_helper.dart';
import 'property_helpers/colors_helper.dart';
import 'property_helpers/icons_helper.dart';

/// Types of properties of a widget
enum PropertyType {
  icon,
  double,
  integer,
  string,
  mainAxisAlignment,
  crossAxisAlignment,
  widget,
  widgets,
  color,
  alignment,
  boxFit,
  boolean,
  scrollPhysics,
  axis,
  fontStyle
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
        return CustomDropdownButton(
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
        );
        break;
      case PropertyType.fontStyle:
        return CustomDropdownButton(
          items: font.map((data) {
            return DropdownMenuItem(
              child: Text(data.name),
              value: data.fontStyle,
            );
          }).toList(),
          onChanged: (value) {
            widget.onValueChanged(value);
          },
          value: widget.currentValue,
        );
      case PropertyType.double:
        return TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Enter a decimal number",
          ),
          controller: SelectingTextEditingController(
              text: widget.currentValue.toString()),
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
          controller: SelectingTextEditingController(
              text: widget.currentValue.toString()),
          keyboardType:
              TextInputType.numberWithOptions(signed: true, decimal: false),
        );
        break;
      case PropertyType.string:
        return TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: "Enter a string"),
          controller: SelectingTextEditingController(
              text: widget.currentValue.toString()),
          onChanged: widget.onValueChanged,
        );
        break;
      case PropertyType.mainAxisAlignment:
        return CustomDropdownButton(
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
        );
        break;
      case PropertyType.crossAxisAlignment:
        return CustomDropdownButton(
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
        return CustomDropdownButton(
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
        );
        break;
      case PropertyType.alignment:
        return CustomDropdownButton(
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
        );
        break;
      case PropertyType.boxFit:
        return CustomDropdownButton(
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
        );
        break;
      case PropertyType.boolean:
        return CustomDropdownButton(
          items: [true, false].map(
            (value) {
              return DropdownMenuItem(
                child: Text(value.toString()),
                value: value,
              );
            },
          ).toList(),
          onChanged: widget.onValueChanged,
          value: widget.currentValue,
        );
        break;
      case PropertyType.scrollPhysics:
        return CustomDropdownButton(
          items: scrollPhysicsTypes.map(
            (ScrollPhysicsInfo value) {
              return DropdownMenuItem(
                child: Text(value.name),
                value: value.physics,
              );
            },
          ).toList(),
          onChanged: widget.onValueChanged,
          value: widget.currentValue,
        );
        break;
      case PropertyType.axis:
        return CustomDropdownButton(
          items: [Axis.horizontal, Axis.vertical].map(
            (value) {
              return DropdownMenuItem(
                child: Text(value.toString()),
                value: value,
              );
            },
          ).toList(),
          onChanged: widget.onValueChanged,
          value: widget.currentValue,
        );
        break;
      default:
        return null;
    }
  }
}

/// Creates a custom [DropdownButton] with borders to display in [Property] inputs
class CustomDropdownButton extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final Function onChanged;
  final value;

  const CustomDropdownButton({Key key, this.items, this.onChanged, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black45,
            ),
            borderRadius: BorderRadius.circular(4.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: DropdownButton(
            items: items,
            onChanged: onChanged,
            value: value,
            isExpanded: true,
            hint: Text("Select Value"),
          ),
        ),
      ),
    );
  }
}
