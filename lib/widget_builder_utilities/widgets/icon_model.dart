import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [Icon] widget
class IconModel extends ModelWidget {
  IconModel() {
    this.widgetType = WidgetType.Icon;
    this.nodeType = NodeType.End;
    this.hasProperties = true;
    this.hasChildren = false;
    this.paramNameAndTypes = {
      "icon": PropertyType.icon,
      "size": PropertyType.double,
    };
    this.params = {
      "size": "20.0",
    };
  }

  @override
  Widget toWidget() {
    return Icon(
      params["icon"] ?? Icons.help_outline,
      size: double.tryParse(params["size"]) ?? 20.0,
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "icon": params["icon"],
      "size": params["size"],
    };
  }
}
