import 'package:flutter/material.dart';

enum WidgetType {
  Text,
  Center,
  Column
}

enum NodeType {
  SingleChild,
  MultipleChildren,
  End,
}

abstract class ModelWidget {
  WidgetType widgetType;
  Map<int, ModelWidget> children = {};
  NodeType nodeType;
  int childIdentifier;

  Widget toWidget();
}
