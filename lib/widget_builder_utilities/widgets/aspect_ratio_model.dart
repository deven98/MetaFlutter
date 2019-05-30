import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

class AspectRatioModel extends ModelWidget {
  AspectRatioModel(){
    this.widgetType = WidgetType.AspectRatio;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "aspectRatio": PropertyType.double,
    };
    this.params = {
      "aspectRatio": "1.0"
    };
  }

  @override
  Widget toWidget() {
    return AspectRatio(
      child: children[0]?.toWidget() ?? Container(),
      aspectRatio: double.tryParse(params["aspectRatio"]) ?? 1.0,
    );
  }

  @override
  Map getParamValuesMap() {
    return {
      "aspectRatio": params["aspectRatio"],
    };
  }
}
