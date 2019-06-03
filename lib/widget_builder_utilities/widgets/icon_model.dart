import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';

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

  @override
  String toCode() {
    return "Icon(\n"
        "${paramToCode(paramName: "icon", isNamed: false, currentValue: params["icon"], defaultValue: "Icons.help_outline", type: PropertyType.icon)}"
        "${paramToCode(paramName: "size", type: PropertyType.double, currentValue: params["size"])}"
        "\n  )";
  }
}
