import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [FittedBox] widget
class FlatButtonModel extends ModelWidget {
  FlatButtonModel() {
    this.widgetType = WidgetType.FlatButton;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "color": PropertyType.color,
    };
  }

  @override
  Widget toWidget() {
    return FlatButton(
      child: children[0]?.toWidget() ?? Container(),
      onPressed: () {},
      color: params["color"],
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "color": params["color"],
    };
  }

  @override
  String toCode() {
    return '''FlatButton(
      child: ${children[0]?.toCode() ?? 'Container()'},
      onPressed: () {},
      color: ${params["color"]},
    )''';
  }
}
