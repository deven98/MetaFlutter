import 'package:flutter/material.dart';

import '../model_widget.dart';

class ColumnModel extends ModelWidget {

  ColumnModel() {
    this.widgetType = WidgetType.Column;
    this.nodeType = NodeType.MultipleChildren;
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
}
