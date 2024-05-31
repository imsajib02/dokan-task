import 'package:flutter/material.dart';

extension ExtSizedBox on int {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}