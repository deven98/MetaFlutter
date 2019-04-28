import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

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
  }

  @override
  Widget toWidget() {
    return Column(
      mainAxisAlignment: params["mainAxisAlignment"],
      crossAxisAlignment: params["crossAxisAlignment"],
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
