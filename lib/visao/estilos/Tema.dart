import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData temaEscuro() {
  final baseTheme = ThemeData(
    fontFamily: "Open Sans",
  );
  return baseTheme.copyWith(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF2E7D32),
    primaryColorLight: Color(0xFF95B634),
    primaryColorDark: Color(0xFF08161b),
    highlightColor: Colors.white,
    //primaryColorBrightness: Brightness.dark,
    //accentColor: Colors.white,
  );
}


