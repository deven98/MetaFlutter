import 'package:flutter/material.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property.dart';
import 'package:flutter_app_builder/widget_builder_utilities/property_helpers/colors_helper.dart';

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
