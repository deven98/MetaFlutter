import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [FlutterLogo] widget
class FlutterLogoModel extends ModelWidget {
  FlutterLogoModel() {
    this.widgetType = WidgetType.FlutterLogo;
    this.nodeType = NodeType.End;
    this.hasProperties = true;
    this.hasChildren = false;
    this.paramNameAndTypes = {
      "size": PropertyType.double,
    };
    this.params = {
      "size": "40.0",
    };
  }

  @override
  Widget toWidget() {
    return FlutterLogo(
      size: double.tryParse(params["size"]) ?? 40.0,
    );
  }

  @override
  Map getParamValuesMap() {
    return {"size": params["size"]};
  }

  @override
  String toCode() {
    return "FlutterLogo(\n"
        "${paramToCode(paramName: "size", type: PropertyType.double, currentValue: params["size"])}"
        "\n  )";
  }
}
