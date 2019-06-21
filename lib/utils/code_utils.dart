import 'package:flutter/material.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property_helpers/alignment_helper.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property_helpers/colors_helper.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property_helpers/icons_helper.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property_helpers/scroll_physics_helper.dart';
import 'package:strings/strings.dart';

import 'color_utils.dart';

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
      result = result + currentValue.toCode();
      break;
    case PropertyType.widgets:
      result = result +
          "<Widget>[${currentValue.values.map((w) => w.toCode()).toList().join(
              ",\n")}]";
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

///used to split a string by commas that are not inside brackets. for Example:
///"Text(\"Hi\", textStyle: TextStyle(color: Colors.black)), FlutterLogo()"
///Will be split into two strings:
///"Text(\"Hi\", textStyle: TextStyle(color: Colors.black))", "FlutterLogo()"
///This is used to parse a code of a widget model into a list of params.
List<String> splitCommasNotInsideBrackets(String src) {
  int count = 0,
      squaresCount = 0;
  List<String> split = [];
  //In order to do things more efficient,
  //we'll be comparing integers instead of strings,
  //and using a string buffer instead of strings concatenation.
  StringBuffer buf = StringBuffer();
  int closing = ")".codeUnitAt(0);
  int opening = "(".codeUnitAt(0);
  int squareClosing = "]".codeUnitAt(0);
  int squareOpening = "[".codeUnitAt(0);
  int comma = ",".codeUnitAt(0);
  for (int current in src.codeUnits) {
    if (current == comma && count == 0 && squaresCount == 0) {
      split.add(buf.toString());
      buf.clear();
    } else {
      if (current == opening) {
        count++;
      } else if (current == closing) {
        count--;
      } else if (current == squareOpening) {
        squaresCount++;
      } else if (current == squareClosing) {
        squaresCount--;
      }
      buf.writeCharCode(current);
    }
  }
  //the string is probably not terminated with a comma, so we will want to
  //add whatever's left inside the buffer.
  if (buf.isNotEmpty) {
    split.add(buf.toString());
  }
  buf.clear();
  return split;
}

//code to parse widget models from string
List<String> parseCode({String code}) {
  //remove whitespaces
  code = code.trim();
  code = code.substring(code.indexOf("(") + 1);
  code = code
  //remove all whitespaces that are not inside quotes
      .replaceAll(RegExp("""\\s+(?=([^"]*"[^"]*")*[^"]*\$)"""), "")
      .replaceAll(",)", ")");
  //remove the closing bracket of Text
  code = code.substring(0, code.length - 1);
  List<String> params = splitCommasNotInsideBrackets(code);
  //if there was a redundant comma, remove the last element
  print("params are: [${params.join(", \n")}]");

  if (params.length > 0 && params.last.isEmpty) {
    params.removeLast();
  }
  return params;
}

Map parseNamedParams({List<String> params, List<String> unnamedParams}) {
  //TODO: can a widget really have multiple unnamed params?
  //
  //the widget might have params that are not named.
  //we need to provide their names to this function in order
  //to set their key
  Map m = {};
  int k = 0;
  for (int i = 0; i < params.length; i++) {
    String current = params[i];
    int index = current.indexOf(RegExp(":(?=([^\"]*\"[^\"]*\")*[^\"]*\$)"));
    if (index == -1) {
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

List<String> unnamedParams(WidgetType type) {
  switch (type) {
    case WidgetType.Center:
    case WidgetType.Column:
    case WidgetType.Container:
    case WidgetType.Expanded:
    case WidgetType.Align:
    case WidgetType.FittedBox:
    case WidgetType.TextField:
    case WidgetType.Row:
    case WidgetType.SafeArea:
    case WidgetType.RaisedButton:
    case WidgetType.FlatButton:
    case WidgetType.FlutterLogo:
    case WidgetType.Stack:
    case WidgetType.ListView:
    case WidgetType.GridView:
    case WidgetType.AspectRatio:
    case WidgetType.TransformRotate:
    case WidgetType.TransformTranslate:
    case WidgetType.TransformScale:
    case WidgetType.PageView:
    case WidgetType.CardView:
    case WidgetType.Padding:
      return [];
    case WidgetType.Icon:
      return ["icon"];
    case WidgetType.Text:
      return ["text"];
  }
  print("If you added a new widget type, please add it to this switch");
  print("If it is constructed with unnamed parameters, return them as a list");
  return [];
}

E toModel<E extends ModelWidget>(String code) {
  code = code.trim();
  List<String> list = parseCode(code: code);
  ModelWidget model;
  WidgetType type;
  Map params;
  //the widget name equals to code.substring(0, code.indexOf("("))
  String widgetName = code.substring(0, code.indexOf("("));
  bool found = false;
  for (int i = 0; i < WidgetType.values.length && !found; i++)
    type = WidgetType.values.firstWhere((t) => "$t".contains(widgetName));
  model = getNewModelFromType(type);
  params = parseNamedParams(params: list, unnamedParams: unnamedParams(type));
  model.paramNameAndTypes.forEach((k, t) {
    String key = k;
    PropertyType type = t;
    if (!params.containsKey(key)) {
      //might be an unnamed param
      //might be some special cases
      switch (type) {
        case PropertyType.double:
        case PropertyType.integer:
        case PropertyType.string:
          model.params[key] = "";
          break;
        default:
          model.params[key] = null;
      }
    } else {
      switch (type) {
        case PropertyType.icon:
          model.params[key] =
              icons
                  .firstWhere((i) => params[key].contains(i.name))
                  .iconData;
          break;
        case PropertyType.double:
          model.params[key] = double.tryParse(params[key] ?? "") ?? 0;
          break;
        case PropertyType.integer:
          model.params[key] = int.tryParse(params[key] ?? "") ?? 0;
          break;
        case PropertyType.string:
          model.params[key] =
              toPrintable(params[key].substring(1, params[key].length - 1));
          break;
        case PropertyType.mainAxisAlignment:
          model.params[key] = MainAxisAlignment.values
              .firstWhere((a) => params[key].contains("$a"));
          break;
        case PropertyType.crossAxisAlignment:
          model.params[key] = CrossAxisAlignment.values
              .firstWhere((a) => params[key].contains("$a"));
          break;
        case PropertyType.widget:
          model.children[model.children.keys.length] = toModel(params[key]);
          break;
        case PropertyType.widgets:
        //params[children] = "<Widget>[widget1, widget2, widget3,...]"
          String s = params[key];
          s = s.trim();
          if (s.startsWith("<Widget>")) s = s.substring(8);
          //params[children] = "[widget1, widget2, widget3,...]"
          if ((s.startsWith("[") && s.endsWith("]"))) {
            //params[children] = "widget1, widget2, widget3,..." (this is what we want to parse!)
            s = s.substring(1, s.length - 1);
            List<String> widgets = splitCommasNotInsideBrackets(s);
            //widgets = [widget1, widget2, widget3, ...]
            widgets.forEach((widget) {
              model.children[model.children.keys.length] = toModel(widget);
            });
          } // else it is not a valid list (it might be an expression but we don't support these right now.
          break;
        case PropertyType.color:
          model.params[key] = parseColor(params[key]);
          break;
        case PropertyType.alignment:
          model.params[key] = alignments
              .firstWhere((i) => params[key].contains(i.name))
              .alignment;
          break;
        case PropertyType.boxFit:
          model.params[key] =
              BoxFit.values.firstWhere((fit) => params[key].contains("$fit"));
          break;
        case PropertyType.boolean:
          model.params[key] = params[key].contains("true") ? true : false;
          break;
        case PropertyType.scrollPhysics:
          model.params[key] = scrollPhysicsTypes
              .firstWhere((t) => params[key].contains(t.name))
              .physics;
          break;
        case PropertyType.axis:
          model.params[key] =
              Axis.values.firstWhere((a) => params[key].contains("$a"));
          break;
        case PropertyType.fontStyle:
          model.params[key] =
              FontStyle.values.firstWhere((f) => params[key].contains("$f"));
          break;
      }
    }
  });
  return model;
}