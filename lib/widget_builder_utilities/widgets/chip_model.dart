import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

class ChipModel extends ModelWidget {

  ChipModel(){
this.widgetType = WidgetType.ChipView;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = false;
    this.paramNameAndTypes = {
      "label": PropertyType.string,
      "elevation": PropertyType.double
    };

    this.params = {
      "label": "",
      "elevation": "4.0"
    };
  }

  @override
  Map getParamValuesMap() {
    return {
      "label": params["label"],
      "elevation": params["elevation"]
    };
  }

  @override
  String toCode() {
    return '''
    Chip(
      label: ${params["label"]},
      elevation: ${params["elevation"]},
    );''';
  }

  @override
  Widget toWidget() {
    return Chip(
      label: Text(params["label"]),
      elevation: double.parse(params["elevation"]),
    );
  }

}