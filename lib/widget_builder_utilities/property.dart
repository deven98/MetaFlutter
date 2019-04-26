import 'package:flutter/material.dart';

enum PropertyType {
  icon,
  double,
  integer,
  string
}

class Property extends StatefulWidget {

  final PropertyType type;
  final ValueChanged onValueChanged;
  final currentValue;

  Property(this.type, this.onValueChanged, {this.currentValue});

  @override
  _PropertyState createState() => _PropertyState();
}

class _PropertyState extends State<Property> {
  @override
  Widget build(BuildContext context) {
    switch(widget.type) {
      case PropertyType.icon:
          /*return DropdownButton(items: , onChanged: (value) {
            widget.onValueChanged(value);
          });*/
        break;
      case PropertyType.double:
        return TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
            ),
            labelText: "Enter a decimal number",
          ),
          onChanged: widget.onValueChanged,
          keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
        );
        break;
      case PropertyType.integer:
        return TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
              ),
              labelText: "Enter an integer"
          ),
          onChanged: widget.onValueChanged,
          keyboardType: TextInputType.numberWithOptions(signed: true, decimal: false),
        );
        break;
      case PropertyType.string:
        return TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
              ),
              labelText: "Enter a string"
          ),
          onChanged: widget.onValueChanged,
        );
        break;
    }
  }
}
