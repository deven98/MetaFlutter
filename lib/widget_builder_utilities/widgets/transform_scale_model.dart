import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

class TransformScaleModel extends ModelWidget {
  TransformScaleModel() {
    this.widgetType = WidgetType.TransformScale;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "scale": PropertyType.double,
      "originX": PropertyType.double,
      "originY": PropertyType.double,
    };
    this.params = {
      "scale": "0.0",
      "originX": "0.0",
      "originY": "0.0",
    };
  }

  @override
  Widget toWidget() {
    return Transform.scale(
      child: children[0]?.toWidget() ?? Container(),
      scale: double.tryParse(params["scale"]) ?? 0.0,
      origin: Offset(double.tryParse(params["originX"]) ?? 0.0, double.tryParse(params["originY"]) ?? 0.0),
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "scale": params["scale"],
      "originX": params["originX"],
      "originY": params["originY"],
    };
  }
}
