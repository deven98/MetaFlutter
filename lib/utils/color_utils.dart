import 'package:flutter/material.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';

class ColorPair {
  Color textColor;
  Color backgroundColor;

  ColorPair(this.textColor, this.backgroundColor);
}

final backgroundColors = [
  ColorPair(Colors.blue, Colors.blue[50]),
  ColorPair(Colors.pink, Colors.pink[50]),
  ColorPair(Colors.deepPurple, Colors.deepPurple[50]),
  ColorPair(Colors.orange, Colors.orange[50]),
  ColorPair(Colors.green, Colors.green[50]),
];

ColorPair getColorPair(ModelWidget widget) {
  switch(widget.nodeType) {

    case NodeType.SingleChild:
      return backgroundColors[4];
      break;
    case NodeType.MultipleChildren:
      return backgroundColors[1];
      break;
    case NodeType.End:
      return backgroundColors[0];
      break;
    default:
      return null;
  }
}
