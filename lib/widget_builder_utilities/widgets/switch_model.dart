import 'package:flutter/material.dart';
import '../model_widget.dart';
import '../property.dart';

class SwitchModel extends ModelWidget {
  SwitchModel() {
    this.widgetType = WidgetType.SwitchBox;
    this.nodeType = NodeType.End;
    this.hasProperties = true;
    this.hasChildren = false;
    this.paramNameAndTypes = {
      "value": PropertyType.boolean,
      "activeColor": PropertyType.color
    };

    this.params = {"value": false, "activeColor": Colors.blue};
  }

  @override
  Map getParamValuesMap() {
    return {"value": params["value"], "activeColor": params["activeColor"]};
  }

  @override
  String toCode() {
    return '''
    Switch(
      value: ${params["value"] ?? false},
      onChanged: (i) {},
      activeColor: ${params["activeColor"] ?? Colors.blue},
    );
    ''';
  }

  @override
  Widget toWidget() {
    return Switch(
      value: params["value"] ?? false,
      onChanged: (i) {},
      activeColor: params["activeColor"] ?? Colors.blue,
    );
  }
}
