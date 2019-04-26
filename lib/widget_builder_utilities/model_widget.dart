import 'package:flutter/material.dart';

/// Denotes the type of widget
enum WidgetType { Text, Center, Column, Icon }

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
  bool hasAttributes;
  bool hasChildren;

  /// This method takes the parameters and returns the actual widget to display
  Widget toWidget();

  /// Add child if widget takes children and space is available and return true, else return false
  bool addChild(ModelWidget widget) {
    if (nodeType == NodeType.SingleChild) {
      children[0] = widget;
      return true;
    } else if (nodeType == NodeType.MultipleChildren) {
      children[children.length] = widget;
      return true;
    }

    return false;
  }

  /// Get current values of all parameters of the widget model
  Map getParamValuesMap();
}
