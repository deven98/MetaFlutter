import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [Column] widget
class ColumnModel extends ModelWidget {
  ColumnModel() {
    this.widgetType = WidgetType.Column;
    this.nodeType = NodeType.MultipleChildren;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "mainAxisAlignment": PropertyType.mainAxisAlignment,
      "crossAxisAlignment": PropertyType.crossAxisAlignment
    };
    this.params = {
      "mainAxisAlignment": MainAxisAlignment.start,
      "crossAxisAlignment": CrossAxisAlignment.start,
    };
  }

  @override
  Widget toWidget() {
    return Column(
      mainAxisAlignment: params["mainAxisAlignment"] == null
          ? MainAxisAlignment.start
          : params["mainAxisAlignment"],
      crossAxisAlignment: params["crossAxisAlignment"] == null
          ? CrossAxisAlignment.start
          : params["crossAxisAlignment"],
      children: children.isNotEmpty
          ? children.values.map((widget) {
              return widget.toWidget();
            }).toList()
          : [],
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "mainAxisAlignment": params["mainAxisAlignment"],
      "crossAxisAlignment": params["crossAxisAlignment"],
    };
  }

  @override
  String toCode() {
    return '''Column(
      mainAxisAlignment: ${params["mainAxisAlignment"] == null ? MainAxisAlignment.start : params["mainAxisAlignment"]},
      crossAxisAlignment: ${params["crossAxisAlignment"] == null ? CrossAxisAlignment.start : params["crossAxisAlignment"]},
      children: ${children.isNotEmpty ? children.values.map((widget) {
            return widget.toCode();
          }).toList() : []},
    )''';
  }
}
