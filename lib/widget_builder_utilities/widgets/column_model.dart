import 'package:flutter/material.dart';

import '../model_widget.dart';

class ColumnModel extends ModelWidget {
  ColumnModel() {
    this.widgetType = WidgetType.Column;
    this.nodeType = NodeType.MultipleChildren;
    this.hasProperties = true;
    this.hasChildren = true;
  }

  @override
  Widget toWidget() {
    return Column(
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
