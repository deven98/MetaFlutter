import 'package:flutter/material.dart';

import '../model_widget.dart';
import '../property.dart';

class CardViewModel extends ModelWidget {

  CardViewModel(){
    this.widgetType = WidgetType.CardView;
    this.nodeType = NodeType.SingleChild;
    this.hasProperties = true;
    this.hasChildren = true;
    this.paramNameAndTypes = {
      "elevation": PropertyType.double,
      "color": PropertyType.color,
    };

    this.params = {
      "elevation": 2.0,
      "color": Colors.white,
    };
  }

  @override
  Map getParamValuesMap() {
    return {
        "elevation" : params["elevation"],
        "color" : params["color"]
    };
  }

  @override
  Widget toWidget() {
    return Card(
      child: children[0]?.toWidget() ?? Container(),
      elevation: params["elevation"] ?? 2.0,
      color: params["color"] ?? Colors.white,
    );
  }

  @override
  String toCode() {
    return '''Card(
      child: ${children[0]?.toCode() ?? 'Container()'},
      elevation: ${params["elevation"] ?? 2.0},
      color: ${params["color"] ?? Colors.white},
    )''';
  }


}