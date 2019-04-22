import 'package:flutter/material.dart';
import 'package:flutter_app_builder/pages/home_screen.dart';
import 'package:flutter_app_builder/pages/widget_structure_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WidgetStructurePage(),
    );
  }
}
