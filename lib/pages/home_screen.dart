import 'package:flutter/material.dart';
import 'package:flutter_app_builder/pages/widget_structure_screen.dart';

/// Keep this page for the intro page which has the start, saved programs and template options
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
            _buildButton(),
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

  Widget _buildButton() {
    return FlatButton(
      color: Colors.blue,
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WidgetStructureScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Start",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0
          ),
        ),
      ),
    );
  }
}
