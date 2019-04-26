import 'package:flutter/material.dart';

enum PropertyType {
  icon,
}

class Property extends StatefulWidget {

  final PropertyType type;
  final ValueChanged onValueChanged;

  Property(this.type, this.onValueChanged);

  @override
  _PropertyState createState() => _PropertyState();
}

class _PropertyState extends State<Property> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
