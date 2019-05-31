import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [Row] widget
class RowModel extends ModelWidget {
  RowModel() {
    this.widgetType = WidgetType.Row;
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
    return Row(
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
}
