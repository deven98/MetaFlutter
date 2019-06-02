import 'package:flutter/material.dart';

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
      "value": PropertyType.integer,
      "max": PropertyType.integer,
      "min": PropertyType.integer,
    };
  }

  @override
  Map getParamValuesMap() {
    return {"label": "text", "value": 100, "min": "0", "max": "100"};
  }

  @override
  String toCode() {
    return '''
    Slider(
      value: ${params["value"] ?? 50},
      onChanged: (i) {},
      onChangeEnd: (i){},
      onChangeStart: (i){},
      max: ${params["max"] ?? 100},
      min: ${params["min"] ?? 0},
      label: ${params["label"] ?? ""},
    );
    ''';
  }

  @override
  Widget toWidget() {
    return Slider(
      value: params["value"] ?? 50,
      onChanged: (i) {},
      onChangeEnd: (i){},
      onChangeStart: (i){},
      max: params["max"] ?? 100,
      min: params["min"] ?? 0,
      label: params["label"] ?? "" ,
    );
  }
}
