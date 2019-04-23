import 'package:flutter/material.dart';

/// Denotes the type of widget
enum WidgetType {
  Text,
  Center,
  Column
}

/// Denotes if the widget can have zero, one or multiple children
enum NodeType {
  SingleChild,
  MultipleChildren,
  End,
}

/// Model Widget class
abstract class ModelWidget {
  WidgetType widgetType;
  Map<int, ModelWidget> children = {};
  NodeType nodeType;
  int childIdentifier;
  Map params = {};

  Widget toWidget();

  bool addChild(ModelWidget widget) {
    if(nodeType == NodeType.SingleChild) {
      if(children.length == 0) {
        children[0] = widget;
        return true;
      }
    } else if(nodeType == NodeType.MultipleChildren) {
      children[children.length] = widget;
      return true;
    }

    return false;
  }
}
