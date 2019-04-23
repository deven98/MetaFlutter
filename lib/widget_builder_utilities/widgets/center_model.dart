import 'package:flutter/material.dart';

import '../model_widget.dart';

class CenterModel extends ModelWidget {

  CenterModel() {
    this.widgetType = WidgetType.Center;
    this.nodeType = NodeType.SingleChild;
    this.hasAttributes = false;
    this.hasChildren = true;
  }

  @override
  Widget toWidget() {
    return Center(child: children[0].toWidget(),);
  }

  @override
  Map getParamValuesMap() {
    return null;
  }

}
