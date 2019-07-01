import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property.dart';

import '../model_widget.dart';

/// Provides a model for recreating the [Stack] widget
class StackModel extends ModelWidget {
  StackModel() {
    this.widgetType = WidgetType.Stack;
    this.nodeType = NodeType.MultipleChildren;
    this.hasProperties = false;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "children": PropertyType.widgets
    };
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

  @override
  String toCode() {
    return '''Stack(
      ${paramToCode(paramName: "children",
        type: PropertyType.widgets,
        currentValue: children)},
    )''';
  }
}
