import 'package:flutter/material.dart';

import '../model_widget.dart';

enum TextModelParams {
  text
}

class TextModel extends ModelWidget {

  TextModel() {
    this.widgetType = WidgetType.Text;
    this.nodeType = NodeType.End;
  }

  @override
  Widget toWidget() {
    return Text(params[TextModelParams.text] ?? "");
  }

}
