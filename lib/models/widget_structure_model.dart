
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';
import 'package:scoped_model/scoped_model.dart';

class WidgetStructureModel extends Model {

  ModelWidget rootWidget;

  void addChild(ModelWidget parent, ModelWidget child) {
    parent.addChild(child);
    notifyListeners();
  }

}
