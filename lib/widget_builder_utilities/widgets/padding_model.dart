import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [Padding] widget
class PaddingModel extends ModelWidget {
  PaddingModel() {
    this.widgetType = WidgetType.Padding;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "left": PropertyType.double,
      "top": PropertyType.double,
      "right": PropertyType.double,
      "bottom": PropertyType.double,
    };
    this.params = {
      "left": "0.0",
      "top": "0.0",
      "right": "0.0",
      "bottom": "0.0",
    };
  }

  @override
  Widget toWidget() {
    return Padding(
      child: children[0]?.toWidget() ?? Container(),
      padding: EdgeInsets.fromLTRB(
        double.tryParse(params["left"]) ?? 0.0,
        double.tryParse(params["top"]) ?? 0.0,
        double.tryParse(params["right"]) ?? 0.0,
        double.tryParse(params["bottom"]) ?? 0.0,
      ),
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "left": params["left"],
      "top": params["top"],
      "right": params["right"],
      "bottom": params["bottom"],
    };
  }

  @override
  String toCode() {
    return '''Padding(
      padding: EdgeInsets.fromLTRB(
        ${paramToCode(isNamed: false, type: PropertyType.double, currentValue: params["left"], defaultValue: "0.0")}
        ${paramToCode(isNamed: false, type: PropertyType.double, currentValue: params["top"], defaultValue: "0.0")}
        ${paramToCode(isNamed: false, type: PropertyType.double, currentValue: params["right"], defaultValue: "0.0")}
        ${paramToCode(isNamed: false, type: PropertyType.double, currentValue: params["bottom"], defaultValue: "0.0")}
      ),
      child: ${children[0]?.toCode() ?? 'Container()'},
    )''';
  }
}
