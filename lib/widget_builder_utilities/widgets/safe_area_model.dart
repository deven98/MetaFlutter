import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [SafeArea] widget
class SafeAreaModel extends ModelWidget {
  SafeAreaModel() {
    this.widgetType = WidgetType.SafeArea;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = false;
    this.hasChildren = true;
  }

  @override
  Widget toWidget() {
    return SafeArea(
      child: children[0]?.toWidget() ?? Container(),
    );
  }

  @override
  Map getParamValuesMap() {
    return {};
  }

  @override
  String toCode() {
    return '''SafeArea(
      child: ${children[0]?.toCode() ?? 'Container()'},
    )''';
  }
}
