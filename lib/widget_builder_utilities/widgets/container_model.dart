import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

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
    };
    this.params = {
      "width": 0.0,
      "height": 0.0,
    };
  }

  @override
  Widget toWidget() {
    return Container(
      child: children[0]?.toWidget() ?? Container(),
      width: double.tryParse(params["width"]),
      height: double.tryParse(params["height"]),
      color: params["color"],
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "width": params["width"],
      "height": params["height"],
      "color": params["color"],
    };
  }
}
