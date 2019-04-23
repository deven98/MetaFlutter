import 'package:flutter/material.dart';

import '../model_widget.dart';

enum TextModelParams {
  text
}

class TextModel extends ModelWidget {

  TextModel() {
    this.widgetType = WidgetType.Text;
    this.nodeType = NodeType.End;
    this.hasAttributes = true;
    this.hasChildren = false;
  }

  @override
  Widget toWidget() {
    return Text(params[TextModelParams.text] ?? "");
  }

  @override
  Map getParamValuesMap() {
    return {
      "text": params[TextModelParams.text] ?? "",
    };
  }


}
