import 'package:flutter/material.dart';

import '../model_widget.dart';

enum ColumnModelValues {
  mainAxisAlignment,
  crossAxisAlignment
}

class ColumnModel extends ModelWidget {

  ColumnModel() {
    this.widgetType = WidgetType.Column;
    this.nodeType = NodeType.MultipleChildren;
    this.hasAttributes = true;
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
      //TODO: Column params
      "mainAxisAlignment": "Demo Value",
    };
  }
}
