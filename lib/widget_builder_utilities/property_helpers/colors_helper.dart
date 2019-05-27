import 'package:flutter/material.dart';

var colors = [
  ColorInfo("black", Colors.black),
  ColorInfo("red", Colors.red),
  ColorInfo("green", Colors.green),
  ColorInfo("blue", Colors.blue),
  ColorInfo("yellow", Colors.yellow),
  ColorInfo("purple", Colors.purple),
  ColorInfo("amber", Colors.amber),
  ColorInfo("cyan", Colors.cyan),
  ColorInfo("grey", Colors.grey),
  ColorInfo("teal", Colors.teal),
  ColorInfo("pink", Colors.pink),
  ColorInfo("orange", Colors.orange),
  ColorInfo("white", Colors.white),
  ColorInfo("transparent", Colors.transparent),
];

class ColorInfo {
  String name;
  Color color;

  ColorInfo(this.name, this.color);
}
