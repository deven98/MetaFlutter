import 'package:flutter/material.dart';
import 'package:flutter_app_builder/pages/widget_structure_screen.dart';

import 'about_screen.dart';

/// First page to see after splash screen.
/// Keep this page as entry for main program, saved templates, etc.

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/home_bg.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildTitle(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Meta",
          style: TextStyle(color: Colors.teal, fontSize: 36.0),
        ),
        Text(
          "Flutter",
          style: TextStyle(color: Colors.blue, fontSize: 36.0),
        )
      ],
    );
  }

  Widget _buildButtons() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 120.0,
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WidgetStructureScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Start",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          SizedBox(
            width: 120.0,
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "About",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
