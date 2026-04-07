import 'package:flutter/material.dart';

extension DarkModeChecker on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
