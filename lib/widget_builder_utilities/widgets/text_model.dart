import 'package:flutter/material.dart';

import '../model_widget.dart';

class TextModel extends ModelWidget {
  String text;

  TextModel(this.text) {
    this.widgetType = WidgetType.Text;
    this.nodeType = NodeType.End;
  }

  @override
  Widget toWidget() {
    return Text(text ?? "");
  }

}
