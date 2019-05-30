import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

class ListViewModel extends ModelWidget {
  ListViewModel() {
    this.widgetType = WidgetType.ListView;
    this.nodeType = NodeType.MultipleChildren;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "scrollPhysics": PropertyType.scrollPhysics,
      "shrinkWrap": PropertyType.boolean,
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
      shrinkWrap: params["shrinkWrap"] ?? false,
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "scrollPhysics": params["scrollPhysics"],
    };
  }
}
