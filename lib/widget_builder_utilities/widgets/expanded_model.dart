import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [Expanded] widget
class ExpandedModel extends ModelWidget {

  ExpandedModel(){
    this.widgetType = WidgetType.Expanded;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "flex": PropertyType.integer,
    };
    this.params = {
      "flex": "1",
    };
  }

  @override
  Widget toWidget() {
    return Expanded(
      child: children[0]?.toWidget() ?? Container(),
      flex: int.tryParse(params["flex"]),
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "flex": params["flex"],
    };
  }

  @override
  String toCode() {
    return '''Expanded(
      child: ${children[0]?.toCode() ?? 'Container()'},
      flex: ${int.tryParse(params["flex"])},
    )''';
  }

}