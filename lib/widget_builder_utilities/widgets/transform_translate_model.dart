import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [Transform.translate] widget
class TransformTranslateModel extends ModelWidget {
  TransformTranslateModel() {
    this.widgetType = WidgetType.TransformTranslate;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "translationX": PropertyType.double,
      "translationY": PropertyType.double,
    };
    this.params = {
      "translationX": "0.0",
      "translationY": "0.0",
    };
  }

  @override
  Widget toWidget() {
    return Transform.translate(
      child: children[0]?.toWidget() ?? Container(),
      offset: Offset(double.tryParse(params["translationX"]) ?? 0.0, double.tryParse(params["translationY"]) ?? 0.0),
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "translationX": params["translationX"],
      "translationY": params["translationY"],
    };
  }
}
