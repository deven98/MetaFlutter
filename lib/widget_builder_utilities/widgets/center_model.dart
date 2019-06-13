import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [Center] widget
class CenterModel extends ModelWidget {
  CenterModel() {
    this.widgetType = WidgetType.Center;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "widthFactor": PropertyType.double,
      "heightFactor": PropertyType.double,
      "child": PropertyType.widget
    };
    this.params = {
      "widthFactor": "100.0",
      "heightFactor": "100.0",
    };
  }

  @override
  Widget toWidget() {
    return Center(
      child: children[0]?.toWidget() ?? Container(),
      widthFactor: double.tryParse(params["widthFactor"].toString()),
      heightFactor: double.tryParse(params["heightFactor"].toString()),
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "widthFactor": params["widthFactor"],
      "heightFactor": params["heightFactor"],
    };
  }

  @override
  String toCode() {
    return "Center(\n"
        "${paramToCode(paramName: "widthFactor", currentValue: double.tryParse(params["widthFactor"].toString()), type: PropertyType.double)}"
        "${paramToCode(paramName: "heightFactor", currentValue: double.tryParse(params["heightFactor"].toString()), type: PropertyType.double)}"
        "    child: ${children[0]?.toCode() ?? 'Container()'},"
        "\n  )";
  }
}
