import 'package:flutter/material.dart';
import 'package:flutter_app_builder/pages/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // load image on app launch so it won't flash on creating the state
    precacheImage(AssetImage('images/screenshot.png'), context);

    return MaterialApp(

      title: 'MetaFlutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
