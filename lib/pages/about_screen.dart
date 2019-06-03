import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<String> contributors = [
    "Deven Joshi (Creator and maintainer)",
    "Tushar Parmar",
    "sherlockbeard"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('images/screenshot.png'),
          Center(
            child: Text(
              "MetaFlutter",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FittedBox(
                child: Text(
                  "Experiment with Flutter widgets on your phone!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                  '''MetaFlutter allows you to create Flutter layouts using a wide and constantly growing range of Flutter widgets.
              \nBuild out an idea you had instantly, try out something you've never tried before or just use it as a tool for Flutter layout demonstrations. 
              \nNo login. Free to use. Open-source.'''),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Authors",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          for (var contributor in contributors)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Text(contributor),
            ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Want to contribute?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: InkWell(
                    child: Text(
                      "Click here",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      _launchURL();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    const url = 'https://github.com/deven98/MetaFlutter';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
