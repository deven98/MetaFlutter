import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

class GridViewModel extends ModelWidget {
  GridViewModel() {
    this.widgetType = WidgetType.GridView;
    this.nodeType = NodeType.MultipleChildren;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "physics": PropertyType.scrollPhysics,
      "shrinkWrap": PropertyType.boolean,
      "crossAxisCount": PropertyType.integer,
    };
    this.params = {
      "shrinkWrap": false,
    };
  }

  @override
  Widget toWidget() {
    return GridView(
      children: children.isNotEmpty
          ? children.values.map((widget) {
              return widget.toWidget();
            }).toList()
          : [],
      shrinkWrap: params["shrinkWrap"] ?? false,
      physics: params["physics"],
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: params["crossAxisCount"] ?? 2),
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "physics": params["physics"],
      "shrinkWrap": params["shrinkWrap"],
      "crossAxisCount": PropertyType.integer,
    };
  }
}
