import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property_helpers/colors_helper.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [Container] widget

class ContainerModel extends ModelWidget {
  // ignore: public_member_api_docs
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
      "radius-topright":PropertyType.double,
      "radius-topleft":PropertyType.double,
      "radius-bottomright":PropertyType.double,
      "radius-bottomleft":PropertyType.double,
      "border-width":PropertyType.double,
      "border-color":PropertyType.color,
    };
    this.params = {
      "width": "100",
      "height": "100",
      "color":colors[3].color,
      "radius-topright":"10.0",
      "radius-topleft":"10.0",
      "radius-bottomright":"10.0",
      "radius-bottomleft":"10.0",
      "border-width":"1.5",
      "border-color":colors[0].color,
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
        borderRadius:
              BorderRadius.only(
                  topLeft: Radius.circular(double.tryParse(params["radius-topleft"])),
                  topRight: Radius.circular(double.tryParse(params["radius-topright"])),
                  bottomLeft: Radius.circular(double.tryParse(params["radius-bottomleft"])),
                  bottomRight: Radius.circular(double.tryParse(params["radius-bottomright"]))
              ),
        border: Border.all(color : params["border-color"],width:double.tryParse(params["border-width"]) )
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
      "radius-topleft":params["radius-topleft"],
      "radius-topright":params["radius-topright"],
      "radius-bottomleft":params["radius-bottomleft"],
      "radius-bottomright":params["radius-bottomright"],
      "border-width":params["border-width"],
      "border-color":params["border-color"],
    };
  }

  @override
  String toCode() {
    return "Container(\n"
        "${paramToCode(paramName: "width", currentValue: double.tryParse(params["width"]), type: PropertyType.double)}"
        "${paramToCode(paramName: "height", currentValue: double.tryParse(params["height"]), type: PropertyType.double)}"
        "${paramToCode(paramName: "alignment", type: PropertyType.alignment, currentValue: params["alignment"])}"
        "    decoration: BoxDecoration(\n"
        "${paramToCode(paramName: "color", type: PropertyType.color, currentValue: params["color"])}"
        "    borderRadius: \n\t BorderRadius.all(new Radius.circular( ${double.tryParse(params["radius"])})),"
        "    ),"
        "\n    child: ${children[0]?.toCode() ?? 'Container()'},"
        "\n  )";
  }
}
