import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [AspectRatio] widget
class AspectRatioModel extends ModelWidget {
  AspectRatioModel() {
    this.widgetType = WidgetType.AspectRatio;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "aspectRatio": PropertyType.double,
    };
    this.params = {"aspectRatio": "1.0"};
  }

  @override
  Widget toWidget() {
    return AspectRatio(
      child: children[0]?.toWidget() ?? Container(),
      aspectRatio: double.tryParse(params["aspectRatio"]) ?? 1.0,
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "aspectRatio": params["aspectRatio"],
    };
  }

  @override
  String toCode() {
    return "AspectRatio(\n"
        "${paramToCode(paramName: "aspectRatio", type: PropertyType.double, currentValue: double.tryParse(params["aspectRatio"]))}"
        "    child: ${children[0]?.toCode() ?? 'Container()'},"
        "\n  )";
  }
}
