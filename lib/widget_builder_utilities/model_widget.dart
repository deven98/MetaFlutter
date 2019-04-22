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
