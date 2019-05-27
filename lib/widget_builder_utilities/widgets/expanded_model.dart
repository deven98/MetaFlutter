import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

class ExpandedModel extends ModelWidget {

  ExpandedModel(){
    this.widgetType = WidgetType.Expanded;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "flex": PropertyType.integer,
    };
    this.params = {
      "flex": "1",
    };
  }

  @override
  Widget toWidget() {
    return Expanded(
      child: children[0]?.toWidget() ?? Container(),
      flex: int.tryParse(params["flex"]),
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "flex": params["flex"],
    };
  }

}