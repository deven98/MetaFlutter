import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [Transform.rotate] widget
class TransformRotateModel extends ModelWidget {
  TransformRotateModel() {
    this.widgetType = WidgetType.TransformRotate;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "angle": PropertyType.double,
      "originX": PropertyType.double,
      "originY": PropertyType.double,
    };
    this.params = {
      "angle": "0.0",
      "originX": "0.0",
      "originY": "0.0",
    };
  }

  @override
  Widget toWidget() {
    return Transform.rotate(
      child: children[0]?.toWidget() ?? Container(),
      angle: double.tryParse(params["angle"]) ?? 0.0,
      origin: Offset(double.tryParse(params["originX"]) ?? 0.0, double.tryParse(params["originY"]) ?? 0.0),
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "angle": params["angle"],
      "originX": params["originX"],
      "originY": params["originY"],
    };
  }
}
