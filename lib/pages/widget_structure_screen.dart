import 'package:flutter/material.dart';
import 'package:flutter_app_builder/pages/result_screen.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/center_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/column_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/text_model.dart';

class WidgetStructurePage extends StatefulWidget {
  @override
  _WidgetStructurePageState createState() => _WidgetStructurePageState();
}

class _WidgetStructurePageState extends State<WidgetStructurePage> {
  ModelWidget root;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    root = ColumnModel();
    root.addChild(CenterModel());
    TextModel model = TextModel();
    model.params[TextModelParams.text] = "Hello World";
    root.children[0].addChild(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                    root.toWidget(),
                  ),
            ),
          );
        },
        label: Text("Done"),
        icon: Icon(Icons.done),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Build It!"),
          ),
//          _buildInfo(),
//          _buildChildren(),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return SliverList(delegate: SliverChildListDelegate([

    ]));
  }

  Widget _buildChildren() {}
}
