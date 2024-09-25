import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';


ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: mBackgroundColor,
      elevation: 0.0,

    ),
    primaryColor: mBackgroundColor,
    textSelectionTheme: TextSelectionThemeData(cursorColor: mBackgroundColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme(){
  return TextTheme(

  );
}