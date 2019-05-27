import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

class CenterModel extends ModelWidget {
  CenterModel(){
    this.widgetType = WidgetType.Center;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "widthFactor": PropertyType.double,
      "heightFactor": PropertyType.double,
    };
  }

  @override
  Widget toWidget() {
    return Center(
      child: children[0]?.toWidget() ?? Container(),
      widthFactor: double.tryParse(params["widthFactor"].toString()) ?? null,
      heightFactor: double.tryParse(params["heightFactor"].toString()) ?? null,
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "widthFactor": params["widthFactor"],
      "heightFactor": params["heightFactor"],
    };
  }
}
