import 'package:flutter/material.dart';

var font = [FontInfo("Normal", FontStyle.normal),
FontInfo("Italic", FontStyle.italic)];


class FontInfo {
  String name;
  FontStyle fontStyle;

  FontInfo(this.name, this.fontStyle);
}
