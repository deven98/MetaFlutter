import 'package:flutter/material.dart';

import '../model_widget.dart';

class CenterModel extends ModelWidget {

  CenterModel() {
    this.widgetType = WidgetType.Center;
    this.nodeType = NodeType.SingleChild;
  }

  @override
  Widget toWidget() {
    return Center(child: children[0].toWidget(),);
  }
  
}
