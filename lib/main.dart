import 'package:flutter/material.dart';
import 'package:flutter_app_builder/pages/home_screen.dart';
import 'package:flutter_app_builder/pages/widget_structure_screen.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/column_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/text_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/widget_structure_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<WidgetStructureModel>(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WidgetStructurePage(TextModel(), true),
      ),
      model: WidgetStructureModel(),
    );
  }
}
