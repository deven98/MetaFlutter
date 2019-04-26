import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

class TextModel extends ModelWidget {

  TextModel() {
    this.widgetType = WidgetType.Text;
    this.nodeType = NodeType.End;
    this.hasProperties = true;
    this.hasChildren = false;
    this.paramNameAndTypes = {
      "text": PropertyType.string,
    };
  }

  @override
  Widget toWidget() {
    return Text(params["text"] ?? "");
  }

  @override
  Map getParamValuesMap() {
    return {
      "text": params["text"] ?? "",
    };
  }


}
