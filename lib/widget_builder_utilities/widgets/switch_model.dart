import 'package:flutter/material.dart';
import '../model_widget.dart';
import '../property.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';

class SwitchModel extends ModelWidget {
  SwitchModel() {
    this.widgetType = WidgetType.Switch;
    this.nodeType = NodeType.End;
    this.hasProperties = true;
    this.hasChildren = false;
    this.paramNameAndTypes = {
      "value": PropertyType.boolean,
      "activeColor": PropertyType.color
    };

    this.params = {"value": false, "activeColor": Colors.blue};
  }

  @override
  Map getParamValuesMap() {
    return {"value": params["value"], "activeColor": params["activeColor"]};
  }

  @override
  String toCode() {
    return 
    "Switch(\n"
    "${paramToCode(paramName: "value", type: PropertyType.boolean, currentValue: params["value"])}"
      "    onChanged: (i) {}, \n"
      "${paramToCode(paramName: "activeColor", type: PropertyType.color, currentValue: params["activeColor"])}"
    ")";
  }

  @override
  Widget toWidget() {
    return Switch(
      value: params["value"] ?? false,
      onChanged: (i) {},
      activeColor: params["activeColor"] ?? Colors.blue,
    );
  }
}
