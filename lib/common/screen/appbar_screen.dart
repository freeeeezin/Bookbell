import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants.dart';

class AppbarScreen extends StatelessWidget {

  bool leading = false;

  AppbarScreen(this.leading,{super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:mBackgroundColor ,
        appBar: AppBar(
          automaticallyImplyLeading: leading,
          title: 'BookBell'.text.xl4.black.fontFamily(GoogleFonts.dancingScript().fontFamily!).make(),
          backgroundColor: mBackgroundColor,
        ),

    );
  }
}
