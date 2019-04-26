import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

class IconModel extends ModelWidget {

  IconModel() {
    this.widgetType = WidgetType.Icon;
    this.nodeType = NodeType.End;
    this.hasProperties = true;
    this.hasChildren = false;
    this.paramNameAndTypes = {
      "icon": PropertyType.icon,
    };
  }

  @override
  Widget toWidget() {
    return Icon(params["icon"] ?? Icons.help_outline);
  }

  @override
  Map getParamValuesMap() {
    return {
      "icon": params["icon"],
    };
  }
}