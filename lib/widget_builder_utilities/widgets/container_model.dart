import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [Container] widget
class ContainerModel extends ModelWidget {
  ContainerModel() {
    this.widgetType = WidgetType.Container;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "width": PropertyType.double,
      "height": PropertyType.double,
      "color": PropertyType.color,
      "alignment": PropertyType.alignment
    };
    this.params = {
      "width": "0.0",
      "height": "0.0",
    };
  }

  @override
  Widget toWidget() {
    return Container(
      child: children[0]?.toWidget() ?? Container(),
      width: double.tryParse(params["width"]),
      height: double.tryParse(params["height"]),
      alignment: params["alignment"],
      decoration: BoxDecoration(
        color: params["color"],
      ),
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "width": params["width"],
      "height": params["height"],
      "color": params["color"],
      "alignment": params["alignment"],
    };
  }

  @override
  String toCode() {
    return '''Container(
      child: ${children[0]?.toCode() ?? 'Container()'},
      width: ${double.tryParse(params["width"])},
      height: ${double.tryParse(params["height"])},
      alignment: ${params["alignment"]},
      decoration: BoxDecoration(
        color: ${params["color"]},
      ),
    )''';
  }
}
