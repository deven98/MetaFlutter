import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_builder/components/syntax_highlighter.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';

class CodeScreen extends StatefulWidget {
  final ModelWidget root;

  CodeScreen(this.root);

  @override
  _CodeScreenState createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  String resultCode = "";
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    resultCode = widget.root.toCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Your Layout Code"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: RichText(text: DartSyntaxHighlighter().format(resultCode)),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Clipboard.setData(new ClipboardData(text: resultCode));
          _scaffoldKey.currentState.showSnackBar(
            new SnackBar(
              content: new Text("Copied to Clipboard"),
            ),
          );
        },
        label: Text("Copy"),
        icon: Icon(
          Icons.content_copy,
        ),
      ),
    );
  }
}
