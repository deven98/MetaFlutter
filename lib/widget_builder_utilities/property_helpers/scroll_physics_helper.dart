import 'package:flutter/material.dart';

/// Provides ScrollPhysics for selection of property
List<ScrollPhysicsInfo> scrollPhysicsTypes = [
  ScrollPhysicsInfo(
      "AlwaysScrollableScrollPhysics", AlwaysScrollableScrollPhysics()),
  ScrollPhysicsInfo(
      "NeverScrollableScrollPhysics", NeverScrollableScrollPhysics()),
  ScrollPhysicsInfo("BouncingScrollPhysics", BouncingScrollPhysics()),
  ScrollPhysicsInfo("ClampingScrollPhysics", ClampingScrollPhysics()),
  ScrollPhysicsInfo("FixedExtentScrollPhysics", FixedExtentScrollPhysics()),
];

class ScrollPhysicsInfo {
  String name;
  ScrollPhysics physics;

  ScrollPhysicsInfo(this.name, this.physics);
}
