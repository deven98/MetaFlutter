import 'package:flutter/material.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property_helpers/alignment_helper.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property_helpers/colors_helper.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property_helpers/icons_helper.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property_helpers/scroll_physics_helper.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/text_model.dart';

/// Converts parameters to string values for converting to code
String paramToCode(
    {String paramName,
      @required PropertyType type,
      currentValue,
      String defaultValue,
      bool isNamed = true}) {
  String result = "";

  if (isNamed) result = "$paramName: ";

  // If the current value is null, either return default value or return an empty string if default value is also null.
  if (currentValue == null) {
    if (defaultValue == null) {
      return "";
    }

    result = result + defaultValue + ",";
    return result;
  }

  // If
  switch (type) {
    case PropertyType.icon:
      result = result + currentValue.toString();
      break;
    case PropertyType.double:
      result = result + currentValue.toString();
      break;
    case PropertyType.integer:
      result = result + currentValue.toString();
      break;
    case PropertyType.string:
      result = result + '"' + currentValue.toString() + '"';
      break;
    case PropertyType.mainAxisAlignment:
      result = result + currentValue.toString();
      break;
    case PropertyType.crossAxisAlignment:
      result = result + currentValue.toString();
      break;
    case PropertyType.widget:
    // TODO: Widget as a parameter is not supported in the app yet
      result = result + currentValue.toCode();
      break;
    case PropertyType.color:
      result = result + getName(currentValue);
      break;
    case PropertyType.alignment:
      result = result + "Alignment." + currentValue.toString();
      break;
    case PropertyType.boxFit:
      result = result + currentValue.toString();
      break;
    case PropertyType.boolean:
      result = result + currentValue.toString();
      break;
    case PropertyType.scrollPhysics:
      result = result + currentValue.toString() + "()";
      break;
    case PropertyType.axis:
      result = result + currentValue.toString();
      break;
    case PropertyType.fontStyle:
      result = result + currentValue.toString();
      break;
  }

  return "    " + result + ",\n";
}

//code to parse widget models from string
List<String> parseCode({String code}) {
  //remove whitespaces
  code = code.trim();
  code = code
      .substring(code.indexOf("(") + 1)
      .replaceAll(RegExp("""\\s+(?=([^"]*"[^"]*")*[^"]*\$)"""), "")
      .replaceAll(",)", ")");
  //remove the closing bracket of Text
  code = code.substring(0, code.length - 1);
  //remove all whitespaces that are not inside quotes
  //split by commas that are not inside other brackets
  List<String> params = code.split(RegExp(",(?![^(]*\\))"));
  //if there was a redundant comma, remove the last element
  if (params.last.isEmpty) {
    params.removeLast();
  }
  return params;
}

Map parseNamedParams({List<String> params, List<String> unnamedParams}) {
  //the widget might have params that are not named.
  //we need to provide their names to this function in order
  //to set their key
  Map m = {};
  int k = 0;
  for (int i = 1; i < params.length; i++) {
    String current = params[i];
    int index = current.indexOf(":");
    if(index == -1) {
      String key = unnamedParams[k++];
      m[key] = current;
    } else {
      String key = current.substring(0, current.indexOf(":"));
      String value = current.substring(key.length + 1);
      m[key] = value;
    }
  }
  return m;
}
E codeToModel<E extends ModelWidget>(String code) {
  List<String> list = parseCode(code: code);
  ModelWidget model;
  Map params;
  switch(E) {
    case TextModel:
      params = parseNamedParams(params: list, unnamedParams: ["text"]);
      model = TextModel();
      break;
    //TODO: use getNewModelFromType, parse keys, and then we could analyse what are the unnamed params.
    default:
      break;
  }
  model.paramNameAndTypes.forEach((k, t) {
    String key = k;
    PropertyType type = t;
    switch(type) {
      case PropertyType.icon:
        model.params[key] = icons.firstWhere((i) => params[key].contains(i.name));
        break;
      case PropertyType.double:
        model.params[key] = double.tryParse(params[key] ?? "");
        break;
      case PropertyType.integer:
        model.params[key] = int.tryParse(params[key] ?? "");
        break;
      case PropertyType.string:
        model.params[key] = params[key];
        break;
      case PropertyType.mainAxisAlignment:
        model.params[key] = MainAxisAlignment.values.firstWhere((a) => params[key].contains("$a"));
        break;
      case PropertyType.crossAxisAlignment:
        model.params[key] = CrossAxisAlignment.values.firstWhere((a) => params[key].contains("$a"));
        break;
      case PropertyType.widget:
        model.params[key] = codeToModel(params[key]);
        break;
      case PropertyType.color:
      //TODO: figure out colors
        model.params[key] = Colors.black;
        break;
      case PropertyType.alignment:
        model.params[key] = alignments.firstWhere((i) => params[key].contains(i.name)).alignment;
        break;
      case PropertyType.boxFit:
        model.params[key] = BoxFit.values.firstWhere((fit) => params[key].contains("$fit"));
        break;
      case PropertyType.boolean:
        model.params[key] = params[key].contains("true") ? true: false;
        break;
      case PropertyType.scrollPhysics:
        model.params[key] = scrollPhysicsTypes.firstWhere((t) => params[key].contains(t.name));
        break;
      case PropertyType.axis:
        model.params[key] = Axis.values.firstWhere((a) => params[key].contains("$a"));
        break;
      case PropertyType.fontStyle:
        model.params[key] = FontStyle.values.firstWhere((f) => params[key].contains("$f"));
        break;
    }
    return model;
  });


}
