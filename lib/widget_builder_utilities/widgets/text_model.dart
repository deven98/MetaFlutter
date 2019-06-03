import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [Text] widget
class TextModel extends ModelWidget {
  TextModel() {
    this.widgetType = WidgetType.Text;
    this.nodeType = NodeType.End;
    this.hasProperties = true;
    this.hasChildren = false;
    this.paramNameAndTypes = {
      "text": PropertyType.string,
      "fontSize": PropertyType.double,
      "color": PropertyType.color,
      "fontStyle": PropertyType.fontStyle
    };
    this.params = {
      "text": "",
      "fontSize": "14.0",
      "color": Colors.black,
      "fontStyle": FontStyle.normal
    };
  }

  @override
  Widget toWidget() {
    return Text(
      params["text"] ?? "",
      style: TextStyle(
          fontSize: double.tryParse(params["fontSize"]) ?? 14.0,
          color: params["color"] ?? Colors.black,
          fontStyle: params["fontStyle"] ?? FontStyle.normal),
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "text": params["text"],
      "fontSize": params["fontSize"],
      "color": params["color"],
      "fontStyle": params["fontStyle"]
    };
  }

  @override
  String toCode() {
    return "Text(\n"
        "${paramToCode(isNamed: false, type: PropertyType.string, currentValue: params["text"], defaultValue: "")}"
        "  style: TextStyle(\n"
        "${paramToCode(paramName: "fontSize", type: PropertyType.double, currentValue: double.tryParse(params["fontSize"]), defaultValue: 14.0.toString())}"
        "${paramToCode(paramName: "color", type: PropertyType.color, currentValue: params["color"])}"
        "${paramToCode(paramName: "fontStyle", type: PropertyType.fontStyle, currentValue: params["fontStyle"], defaultValue: "FontStyle.normal")}"
        "  ),"
        "\n)";
  }
}
