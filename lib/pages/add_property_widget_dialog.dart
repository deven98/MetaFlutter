import 'package:flutter/material.dart';

class AddPropertyWidgetDialog extends StatefulWidget {
  @override
  _AddPropertyWidgetDialogState createState() => _AddPropertyWidgetDialogState();
}

class _AddPropertyWidgetDialogState extends State<AddPropertyWidgetDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add widget as property"),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Text("Done"), icon: Icon(Icons.done),),
    );
    //TODO: Add stuff for properties and children
  }
}
