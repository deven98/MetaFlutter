import 'package:flutter/material.dart';

/// Provides alignments for selection of property
var alignments = [
  AlignmentInfo("topLeft", Alignment.topLeft),
  AlignmentInfo("topCenter", Alignment.topCenter),
  AlignmentInfo("topRight", Alignment.topRight),
  AlignmentInfo("centerLeft", Alignment.centerLeft),
  AlignmentInfo("center", Alignment.center),
  AlignmentInfo("centerRight", Alignment.centerRight),
  AlignmentInfo("bottomLeft", Alignment.bottomLeft),
  AlignmentInfo("bottomCenter", Alignment.bottomCenter),
  AlignmentInfo("bottomRight", Alignment.bottomRight),
];

class AlignmentInfo {
  String name;
  Alignment alignment;

  AlignmentInfo(this.name, this.alignment);
}