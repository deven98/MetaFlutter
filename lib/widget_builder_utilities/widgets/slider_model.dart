import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';
import '../model_widget.dart';
import '../property.dart';

class SliderModel extends ModelWidget {
  SliderModel() {
    this.widgetType = WidgetType.Slider;
    this.nodeType = NodeType.End;
    this.hasProperties = true;
    this.hasChildren = false;
    this.paramNameAndTypes = {
      "label": PropertyType.string,
      "value": PropertyType.double,
      "max": PropertyType.double,
      "min": PropertyType.double,
    };

    this.params = {
      "label": "",
      "value": "50.0",
      "max": "100.0",
      "min": "0.0",
    };
  }

  @override
  Map getParamValuesMap() {
    return {"label": "text", "value": "100.0", "min": "0.0", "max": "100.0"};
  }

  @override
  String toCode() {
    return
    "Slider(\n"
    "${paramToCode(paramName: "value", type: PropertyType.double, currentValue: params["value"])}"
      "    onChanged: (i) {},\n"
      "    onChangeEnd: (i){},\n"
      "    onChangeStart: (i){},\n"
      "${paramToCode(paramName: "max", type: PropertyType.double, currentValue: params["max"])}"
      "${paramToCode(paramName: "min", type: PropertyType.double, currentValue: params["min"])}"
      "${paramToCode(paramName: "label", type: PropertyType.string, currentValue: params["label"])}"
    ")";
  }

  @override
  Widget toWidget() {
    return Slider(
      value: params["value"] ?? 50.0,
      onChanged: (i) {},
      onChangeEnd: (i){},
      onChangeStart: (i){},
      max: params["max"] ?? 100.0,
      min: params["min"] ?? 0.0,
      label: params["label"] ?? "" ,
    );
  }
}
