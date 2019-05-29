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
    return Stack(
      children: <Widget>[
        Scaffold(
          body: widget.widget,
        ),
        SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              child: Icon(Icons.clear, size: 30.0,),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
