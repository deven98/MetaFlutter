import 'package:flutter/material.dart';

class SelectingTextEditingController extends TextEditingController {
  SelectingTextEditingController({String text}) : super(text: text) {
    if (text != null) setTextAndPosition(text);
  }

  void setTextAndPosition(String newText, {int caretPosition}) {
    int offset = caretPosition != null ? caretPosition : newText.length;
    value = value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: offset),
        composing: TextRange.empty);
  }
}