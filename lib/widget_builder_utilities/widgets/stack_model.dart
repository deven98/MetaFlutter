import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [Stack] widget
class StackModel extends ModelWidget {
  StackModel() {
    this.widgetType = WidgetType.Stack;
    this.nodeType = NodeType.MultipleChildren;
    this.hasProperties = false;
    this.hasChildren = true;
  }

  @override
  Widget toWidget() {
    return Stack(
      children: children.isNotEmpty
          ? children.values.map(
              (widget) {
                return widget.toWidget();
              },
            ).toList()
          : [],
    );
  }

  @override
  Map getParamValuesMap() {
    return {};
  }
}
