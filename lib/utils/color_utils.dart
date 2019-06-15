import 'package:flutter/material.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';

/// Helper for color-coding the widgets
/// This file helps the UI and not the properties, hence, it is separated from the property_helpers directory
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
  switch (widget.nodeType) {
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


const Map<String, MaterialColor> primaries = {
  "red": Colors.red,
  "pink": Colors.pink,
  "purple": Colors.purple,
  "deepPurple": Colors.deepPurple,
  "indigo": Colors.indigo,
  "blue": Colors.blue,
  "lightBlue": Colors.lightBlue,
  "cyan": Colors.cyan,
  "teal": Colors.teal,
  "green": Colors.green,
  "lightGreen": Colors.lightGreen,
  "lime": Colors.lime,
  "yellow": Colors.yellow,
  "amber": Colors.amber,
  "orange": Colors.orange,
  "deepOrange": Colors.deepOrange,
  "brown": Colors.brown,
  "grey:": Colors.grey,
  "blueGrey": Colors.blueGrey,
};

const Map<String, MaterialAccentColor> accents = {
  "redAccent": Colors.redAccent,
  "pinkAccent": Colors.pinkAccent,
  "purpleAccent": Colors.purpleAccent,
  "deepPurpleAccent": Colors.deepPurpleAccent,
  "indigoAccent": Colors.indigoAccent,
  "blueAccent": Colors.blueAccent,
  "lightBlueAccent": Colors.lightBlueAccent,
  "cyanAccent": Colors.cyanAccent,
  "tealAccent": Colors.tealAccent,
  "greenAccent": Colors.greenAccent,
  "lightGreenAccent": Colors.lightGreenAccent,
  "limeAccent": Colors.limeAccent,
  "yellowAccent": Colors.yellowAccent,
  "amberAccent": Colors.amberAccent,
  "orangeAccent": Colors.orangeAccent,
  "deepOrangeAccent": Colors.deepOrangeAccent,
};
//ignore because we're not using a type in the chosenColor variable, but we
//always return a color.
// ignore: missing_return
Color parseColor(String color) {
  if (color.contains("Color(")) {
    //Color(int value)
    String c = color
        .split("(")
        .last
        .split(")")
        .first;
    if (c.startsWith("\"") && c.endsWith("\"")) {
      c = c.substring(1, c.length - 1);
    }
    return Color(int.tryParse(c) ?? 0);
  } else if (color.startsWith("Colors.")) {
    color = color.substring(7);
    String name;

    ///using var instead of a type to allow both MaterialColor and MaterialAccentColor
    var chosenColor;
    if (color.contains("Accent")) {
      name = color.substring(0, color.indexOf("Accent") + 6);
      if (!accents.containsKey(name)) {
        print("no color found: \"$name\"");
        return Colors.black;
      }
      chosenColor = accents[name];
    } else {
      int i = color.indexOf("[");
      if (i != -1) {
        name = color.substring(0, i);
      }
      chosenColor = primaries[name];
    }
    //if the color has a shade, find it
    RegExp exp = RegExp("\\[\\d+\\]");
    List<Match> matches = exp.allMatches(color).toList();
    if (matches.length == 0) return chosenColor;
    Match m = matches.first;
    int num = int.tryParse(color.substring(m.start + 1, m.end - 1));
    return num == null ? chosenColor : chosenColor[num];
  }
}