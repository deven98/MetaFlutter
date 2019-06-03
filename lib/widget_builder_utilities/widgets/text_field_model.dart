import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [TextField] widget
class TextFieldModel extends ModelWidget {
  TextFieldModel() {
    this.widgetType = WidgetType.TextField;
    this.nodeType = NodeType.End;
    this.hasProperties = true;
    this.hasChildren = false;
    this.paramNameAndTypes = {
      "hintText": PropertyType.string,
    };
    this.params = {
      "hintText": "",
    };
  }

  @override
  Widget toWidget() {
    return TextField(
      decoration: InputDecoration(
        hintText: params["hintText"] ?? "",
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "hintText": params["hintText"],
    };
  }

  @override
  String toCode() {
    return "TextField(\n"
        "decoration: InputDecoration("
        "${paramToCode(paramName: "hintText", type: PropertyType.string, currentValue: params["hintText"])}"
        "  border: OutlineInputBorder(),"
        "),\n"
        "\n  )";
  }
}
