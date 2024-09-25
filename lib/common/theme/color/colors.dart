import 'package:flutter/material.dart';

typedef ColorProvider = Color Function();

abstract class AbstractThemeColors {
  const AbstractThemeColors();

  Color? get  mainColor => Colors.grey[850];
}