import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shoppy/core/enums/console_color.dart';
// ==========================================================================

void coloredPrint(dynamic text, [ConsoleColor color = ConsoleColor.green]) {
  debugPrint('\x1B[${color.code}m$text\x1B[0m'); //
}

// ==========================================================================
String generateShortId({int length = 16}) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789@#^&*-';
  final random = Random();
  return List.generate(
    length,
    (_) => chars[random.nextInt(chars.length)],
  ).join();
}
