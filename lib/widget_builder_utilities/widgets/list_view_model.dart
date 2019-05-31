import 'package:flutter/material.dart';

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
}
