// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/data/question_list.dart';

import 'package:quiz_app/main.dart';

void main() {
  print(generateMap(questions.length));
}

Map<int, dynamic> generateMap(int n) {
  Map<int, dynamic> value = {};
  for (int i = 1; i <= n; i++) {
    value[i] = null;
  }
  return value;
}
