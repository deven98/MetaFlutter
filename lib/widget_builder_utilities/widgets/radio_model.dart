import 'package:flutter/material.dart';
import '../model_widget.dart';
import '../property.dart';

class RadioModel extends ModelWidget {

  RadioModel() {
    this.widgetType = WidgetType.RadioButton;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = false;
    this.hasChildren = false;
  }


  @override
  Map getParamValuesMap() {
    return null;
  }

  @override
  Widget toWidget() {
    return Radio(
      value: 1,
      groupValue: 1,
      onChanged: (i){},
    );
  }

}