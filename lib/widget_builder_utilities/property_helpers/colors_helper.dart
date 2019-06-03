import 'package:flutter/material.dart';

/// Provides colors for selection of property
var colors = [
  ColorInfo("black", Colors.black, Colors.black.toString()),
  ColorInfo("red", Colors.red, Colors.red[500].toString()),
  ColorInfo("green", Colors.green, Colors.green[500].toString()),
  ColorInfo("blue", Colors.blue, Colors.blue[500].toString()),
  ColorInfo("yellow", Colors.yellow, Colors.yellow[500].toString()),
  ColorInfo("purple", Colors.purple, Colors.purple[500].toString()),
  ColorInfo("amber", Colors.amber, Colors.amber[500].toString()),
  ColorInfo("cyan", Colors.cyan, Colors.cyan[500].toString()),
  ColorInfo("grey", Colors.grey, Colors.grey[500].toString()),
  ColorInfo("teal", Colors.teal, Colors.teal[500].toString()),
  ColorInfo("pink", Colors.pink, Colors.pink[500].toString()),
  ColorInfo("orange", Colors.orange, Colors.orange[500].toString()),
  ColorInfo("white", Colors.white, Colors.white.toString()),
  ColorInfo("transparent", Colors.transparent, Colors.transparent.toString()),
];

class ColorInfo {
  String name;
  Color color;
  String hex;

  ColorInfo(this.name, this.color, this.hex);
}

String getName(Color color) {
  ColorInfo info = colors.firstWhere((element) {
    return element.color == color;
  });
  return "Colors.${info.name}";
}
