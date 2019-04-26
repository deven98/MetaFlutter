import 'package:flutter/material.dart';

import '../model_widget.dart';

enum IconModelParams {
  icon,
}

class IconModel extends ModelWidget {

  IconModel() {
    this.widgetType = WidgetType.Icon;
    this.nodeType = NodeType.End;
    this.hasAttributes = true;
    this.hasChildren = false;
  }

  @override
  Widget toWidget() {
    return Icon(params[IconModelParams.icon] ?? Icons.help_outline);
  }

  @override
  Map getParamValuesMap() {
    return {
      "icon": params[IconModelParams.icon],
    };
  }
}