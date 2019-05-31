import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [PageView] widget
class PageViewModel extends ModelWidget {
  PageViewModel() {
    this.widgetType = WidgetType.PageView;
    this.nodeType = NodeType.MultipleChildren;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "physics": PropertyType.scrollPhysics,
      "scrollDirection": PropertyType.axis,
    };
    this.params = {
      "scrollDirection": Axis.horizontal,
    };
  }

  @override
  Widget toWidget() {
    return PageView(
      children: children.isNotEmpty
          ? children.values.map((widget) {
        return widget.toWidget();
      }).toList()
          : [],
      physics: params["physics"] ?? AlwaysScrollableScrollPhysics(),
      scrollDirection: params["scrollDirection"] ?? Axis.horizontal,
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "physics": params["physics"],
      "scrollDirection": params["scrollDirection"]
    };
  }
}
