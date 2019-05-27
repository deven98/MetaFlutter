import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final Widget widget;

  ResultScreen(this.widget);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.widget,
    );
  }
}
