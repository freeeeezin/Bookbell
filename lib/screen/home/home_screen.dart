import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me/constants.dart';
import 'package:me/screen/home/search/default_search_field.dart';
import 'dart:ui';
import 'book_rank_screen.dart';


class HomeScreen extends StatefulWidget {
  static String routeName = "/home";


  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    return const Scaffold(
        backgroundColor: mBackgroundColor,
        body: SingleChildScrollView(
            child: Column(
              children: [
              SizedBox(height: 15,),
            SizedBox(
              height: 350,
              child: BookRankScreen(),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(padding: EdgeInsets.all(20),
                child: DefaultSearchField()
            ),
    ],

    )
    ,

    )
    ,


    );
  }
}




