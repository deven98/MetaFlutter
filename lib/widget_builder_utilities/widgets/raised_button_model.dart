import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [RaisedButton] widget
class RaisedButtonModel extends ModelWidget {
  RaisedButtonModel() {
    this.widgetType = WidgetType.RaisedButton;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "color": PropertyType.color,
    };
  }

  @override
  Widget toWidget() {
    return RaisedButton(
      child: children[0]?.toWidget() ?? Container(),
      onPressed: () {},
      color: params["color"],
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "color": params["color"],
    };
  }

  @override
  String toCode() {
    return "RaisedButton(\n"
        "    onPressed: () {},"
        "${paramToCode(paramName: "color", type: PropertyType.color, currentValue: params["color"])}"
        "    child: ${children[0]?.toCode() ?? 'Container()'},"
        "\n  )";
  }
}
