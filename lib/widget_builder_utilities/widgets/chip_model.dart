import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';
import '../model_widget.dart';
import '../property.dart';

class ChipModel extends ModelWidget {
  ChipModel() {
    this.widgetType = WidgetType.ChipView;
    this.nodeType = NodeType.End;
    this.hasProperties = true;
    this.hasChildren = false;
    this.paramNameAndTypes = {
      "label": PropertyType.string,
      "elevation": PropertyType.double,
      "backgroundColor": PropertyType.color,
    };

    this.params = {"label": "", "elevation": "4.0", };
  }

  @override
  Map getParamValuesMap() {
    return {"label": params["label"], 
    "elevation": params["elevation"],
    "backgroundColor": params["backgroundColor"]};
  }

  @override
  String toCode() {
    return 
    "Chip(\n"
      "${paramToCode(paramName: "label", type: PropertyType.string, currentValue: params["label"])}"
      "${paramToCode(paramName: "elevation", type: PropertyType.double, currentValue: params["elevation"])}"
      "${paramToCode(paramName: "backgroundColor", type: PropertyType.color, currentValue: params["backgroundColor"])}"
    " )";
  }

  @override
  Widget toWidget() {
    return Chip(
      label: Text(params["label"]),
      elevation: double.parse(params["elevation"]) ?? 2.0,
      backgroundColor: params["backgroundColor"] ?? Colors.blue,
    );
  }
}
