import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

/// Provides a model for recreating the [Text] widget
class TextModel extends ModelWidget {
  TextModel() {
    this.widgetType = WidgetType.Text;
    this.nodeType = NodeType.End;
    this.hasProperties = true;
    this.hasChildren = false;
    this.paramNameAndTypes = {
      "text": PropertyType.string,
      "fontSize": PropertyType.double,
      "color": PropertyType.color,
    };
    this.params = {
      "text": "",
      "fontSize": "14.0",
      "color": Colors.black,
    };
  }

  @override
  Widget toWidget() {
    return Text(
      params["text"] ?? "",
      style: TextStyle(
        fontSize: double.tryParse(params["fontSize"]) ?? 14.0,
        color: params["color"] ?? Colors.black,
      ),
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "text": params["text"],
      "fontSize": params["fontSize"],
      "color": params["color"],
    };
  }

  @override
  String toCode() {
    return '''Text(
      '${params["text"] ?? ""}',
      style: TextStyle(
        fontSize: ${double.tryParse(params["fontSize"]) ?? 14.0},
        color: ${params["color"] ?? Colors.black},
      ),
    )''';
  }
}
