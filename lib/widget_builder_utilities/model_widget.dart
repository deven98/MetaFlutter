import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/align_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/aspect_ratio_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/center_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/column_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/container_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/expanded_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/fitted_box_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/flat_button_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/flutter_logo_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/grid_view_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/icon_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/list_view_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/padding_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/page_view_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/raised_button_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/row_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/safe_area_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/stack_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/text_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/text_field_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/transform_rotate_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/transform_scale_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/transform_translate_model.dart';
import 'package:flutter_app_builder/widget_builder_utilities/widgets/card_view_model.dart';

/// Denotes the type of widget
enum WidgetType {
  Text,
  Center,
  Column,
  Icon,
  Container,
  Expanded,
  Align,
  Padding,
  FittedBox,
  TextField,
  Row,
  SafeArea,
  FlatButton,
  RaisedButton,
  FlutterLogo,
  Stack,
  ListView,
  GridView,
  AspectRatio,
  TransformRotate,
  TransformTranslate,
  TransformScale,
  PageView,
  CardView
}

/// Denotes if the widget can have zero, one or multiple children
enum NodeType {
  SingleChild,
  MultipleChildren,
  End,
}

/// Creates a new model for each [WidgetType]
ModelWidget getNewModelFromType(WidgetType type) {
  switch (type) {
    case WidgetType.Text:
      return TextModel();
      break;
    case WidgetType.Center:
      return CenterModel();
      break;
    case WidgetType.Column:
      return ColumnModel();
      break;
    case WidgetType.Icon:
      return IconModel();
      break;
    case WidgetType.Container:
      return ContainerModel();
      break;
    case WidgetType.Expanded:
      return ExpandedModel();
      break;
    case WidgetType.Align:
      return AlignModel();
      break;
    case WidgetType.Padding:
      return PaddingModel();
      break;
    case WidgetType.FittedBox:
      return FittedBoxModel();
      break;
    case WidgetType.TextField:
      return TextFieldModel();
      break;
    case WidgetType.Row:
      return RowModel();
      break;
    case WidgetType.SafeArea:
      return SafeAreaModel();
      break;
    case WidgetType.FlatButton:
      return FlatButtonModel();
      break;
    case WidgetType.RaisedButton:
      return RaisedButtonModel();
      break;
    case WidgetType.FlutterLogo:
      return FlutterLogoModel();
      break;
    case WidgetType.Stack:
      return StackModel();
      break;
    case WidgetType.ListView:
      return ListViewModel();
      break;
    case WidgetType.GridView:
      return GridViewModel();
      break;
    case WidgetType.AspectRatio:
      return AspectRatioModel();
      break;
    case WidgetType.TransformRotate:
      return TransformRotateModel();
      break;
    case WidgetType.TransformScale:
      return TransformScaleModel();
      break;
    case WidgetType.TransformTranslate:
      return TransformTranslateModel();
      break;
    case WidgetType.PageView:
      return PageViewModel();
      break;
    case WidgetType.CardView:
      return CardViewModel();
      break;
    default:
      return null;
      break;
  }
}

/// Creates a new model for each [WidgetType]
WidgetType getModelTypeFromString(String widgetType) {
  for (WidgetType type in WidgetType.values) {
    if (type.toString() == widgetType) {
      return type;
    }
  }
  return null;
}

ModelWidget createWidgetFromJson(String jsonString) {
  Map decodedJson = json.decode(jsonString);

  WidgetType type = getModelTypeFromString(decodedJson["widgetType"]);

  Map<int, ModelWidget> children = {};

  for(int i = 0; i < decodedJson["children"].length; i++) {
    children[i] = createWidgetFromJson(decodedJson["children"][i]);
  }

  ModelWidget widget = getNewModelFromType(type)
    ..paramNameAndTypes = json.decode(decodedJson["paramNameAndTypes"])
    ..params = json.decode(decodedJson["params"])
    ..hasProperties = bool.fromEnvironment(decodedJson["hasProperties"])
    ..hasChildren = bool.fromEnvironment(decodedJson["hasChildren"])
    ..children = children;

  return widget;
}

/// Model Widget class
abstract class ModelWidget {
  /// Type of widget ([Text], [Center], [Column], etc)
  WidgetType widgetType;

  /// Children of the widget
  Map<int, ModelWidget> children = {};

  /// The parent of the current widget
  ModelWidget parent;

  /// How the widget fits into the tree
  /// [NodeType.End] is used for widgets that cannot have children
  /// [NodeType.SingleChild] and [NodeType.MultipleChildren] are self-explanatory
  NodeType nodeType;

  /// Stores the names of all parameters and input types
  Map paramNameAndTypes = {};

  /// The parameter values of the widget
  /// Key is the parameter name and value is the value
  Map params = {};

  /// Denotes if the widget has any properties
  bool hasProperties;

  /// Denotes if the widget has any children
  bool hasChildren;

  /// This method takes the parameters and returns the actual widget to display
  Widget toWidget();

  /// Add child if widget takes children and space is available and return true, else return false
  bool addChild(ModelWidget widget) {
    if (nodeType == NodeType.SingleChild) {
      children[0] = widget;
      return true;
    } else if (nodeType == NodeType.MultipleChildren) {
      children[children.length] = widget;
      return true;
    }

    return false;
  }

  /// Get current values of all parameters of the widget model
  Map getParamValuesMap();

  /// Converts current widget to code and returns as string
  String toCode();

  /// Coverts current widget to JSON for saving into SQLite
  Map<String, dynamic> toJson() {
    return {
      "widgetType": widgetType.toString(),
      "paramNameAndTypes": json.encode(paramNameAndTypes.map((key, value) {
        return MapEntry(key, value.toString());
      })),
      "params": json.encode(params.map((key, value) {
        return MapEntry(key, value.toString());
      })),
      "hasProperties": hasProperties.toString(),
      "hasChildren": hasChildren.toString(),
      "children": children.values.map((child) {
        return json.encode(child.toJson());
      }).toList(),
    };
  }
}
