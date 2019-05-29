import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

class SafeAreaModel extends ModelWidget {
  SafeAreaModel(){
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
}
