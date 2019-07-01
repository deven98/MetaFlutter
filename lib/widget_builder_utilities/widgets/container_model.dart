import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';

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
      "alignment": PropertyType.alignment,
      "child": PropertyType.widget
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
    //if color is null the decoration is empty and we don't need it
    String decoration = (params["color"] != null ?
    "    decoration: BoxDecoration(\n"
        "${paramToCode(paramName: "color",
        type: PropertyType.color,
        currentValue: params["color"])}"
        "    ),"
        :
    ""
    );

    return "Container(\n"
        "${paramToCode(paramName: "width", currentValue: double.tryParse(params["width"]), type: PropertyType.double)}"
        "${paramToCode(paramName: "height", currentValue: double.tryParse(params["height"]), type: PropertyType.double)}"
        "${paramToCode(paramName: "alignment", type: PropertyType.alignment, currentValue: params["alignment"])}"
        "$decoration"
        "\n    child: ${children[0]?.toCode() ?? 'Container()'},"
        "\n  )";
  }
}
