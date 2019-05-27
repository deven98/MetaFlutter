import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

class AlignModel extends ModelWidget {

  AlignModel(){
    this.widgetType = WidgetType.Align;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "widthFactor": PropertyType.double,
      "heightFactor": PropertyType.double,
      "alignment": PropertyType.alignment
    };
    this.params = {
      "widthFactor": "1.0",
      "heightFactor": "1.0",
      "alignment": Alignment.center,
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

}