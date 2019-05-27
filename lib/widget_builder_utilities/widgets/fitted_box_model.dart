import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

class FittedBoxModel extends ModelWidget {

  FittedBoxModel(){
    this.widgetType = WidgetType.FittedBox;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "fit": PropertyType.boxFit,
      "alignment": PropertyType.alignment
    };
    this.params = {
      "fit": BoxFit.contain,
      "alignment": Alignment.center,
    };
  }

  @override
  Widget toWidget() {
    return FittedBox(
      child: children[0]?.toWidget() ?? Container(),
      alignment: params["alignment"] ?? Alignment.center,
      fit: params["fit"] ?? BoxFit.contain,
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "alignment": params["alignment"],
      "fit": params["fit"],
    };
  }

}