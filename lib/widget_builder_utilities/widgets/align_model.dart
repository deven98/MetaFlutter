import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [Align] widget
class AlignModel extends ModelWidget {
  AlignModel() {
    this.widgetType = WidgetType.Align;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "widthFactor": PropertyType.double,
      "heightFactor": PropertyType.double,
      "alignment": PropertyType.alignment,
      "child": PropertyType.widget
    };
    this.params = {
      "widthFactor": "100.0",
      "heightFactor": "100.0",
    };
  }

  @override
  Widget toWidget() {
    return Align(
      child: children[0]?.toWidget() ?? Container(),
      widthFactor: double.tryParse(params["widthFactor"].toString()) ?? null,
      heightFactor: double.tryParse(params["heightFactor"].toString()) ?? null,
      alignment: params["alignment"] ?? Alignment.center,
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "widthFactor": params["widthFactor"],
      "heightFactor": params["heightFactor"],
      "alignment": params["alignment"],
    };
  }

  @override
  String toCode() {
    return "Align(\n"
        "${paramToCode(paramName: "widthFactor", type: PropertyType.double, currentValue: double.tryParse(params["widthFactor"].toString()))}"
        "${paramToCode(paramName: "heightFactor", type: PropertyType.double, currentValue: double.tryParse(params["heightFactor"].toString()))}"
        "${paramToCode(paramName: "alignment", type: PropertyType.alignment, currentValue: params["alignment"])}"
        "    child: ${children[0]?.toCode() ?? "Container()"},"
        "\n  )";
  }
}
