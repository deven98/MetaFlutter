import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/code_utils.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [ListView] widget
class ListViewModel extends ModelWidget {
  ListViewModel() {
    this.widgetType = WidgetType.ListView;
    this.nodeType = NodeType.MultipleChildren;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "physics": PropertyType.scrollPhysics,
      "shrinkWrap": PropertyType.boolean,
    };
    this.params = {
      "shrinkWrap": false,
    };
  }

  @override
  Widget toWidget() {
    return ListView(
      children: children.isNotEmpty
          ? children.values.map((widget) {
              return widget.toWidget();
            }).toList()
          : [],
      physics: params["physics"] ?? AlwaysScrollableScrollPhysics(),
      shrinkWrap: params["shrinkWrap"] ?? false,
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "physics": params["physics"],
      "shrinkWrap": params["shrinkWrap"],
    };
  }

  @override
  String toCode() {
    return "ListView(\n"
        "${paramToCode(paramName: "shrinkWrap", currentValue: params["shrinkWrap"], type: PropertyType.boolean)}"
        "${paramToCode(paramName: "physics", type: PropertyType.scrollPhysics, currentValue: params["physics"])}"
        '''    children: ${children.isNotEmpty ? children.values.map((widget) {
            return widget.toCode();
          }).toList() : []},'''
        "\n  )";
  }
}
