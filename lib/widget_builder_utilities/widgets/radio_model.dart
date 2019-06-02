import 'package:flutter/material.dart';
import '../model_widget.dart';
import '../property.dart';

class RadioModel extends ModelWidget {

  RadioModel() {
    this.widgetType = WidgetType.RadioButton;
    this.nodeType = NodeType.End;
    this.hasProperties = false;
    this.hasChildren = false;
  }


  @override
  Map getParamValuesMap() {
    return {
      
    };
  }

  @override
  Widget toWidget() {
    return Radio(
      value: 1,
      groupValue: 1,
      onChanged: (i){},
    );
  }

  @override
  String toCode() {
    return '''
    Radio(
      value: 1,
      groupValue: 1,
      onChanged: (i){},
    );
    ''';
  }

}