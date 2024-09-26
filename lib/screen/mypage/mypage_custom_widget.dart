import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/constants.dart';
import 'package:me/screen/mypage/like_page.dart';
import 'package:me/screen/mypage/my_club_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../auth/controller/AuthController.dart';
import '../../controller/dialogController.dart';


class MyPageCustomWidget extends StatefulWidget {

  const MyPageCustomWidget({super.key});


  static const List<Tab> myTabs = <Tab>[
    Tab(text: '관심도서'),
    Tab(text: '나의 모임'),
  ];

  @override
  State<MyPageCustomWidget> createState() => _MyPageCustomWidgetState();
}

class _MyPageCustomWidgetState extends State<MyPageCustomWidget> with SingleTickerProviderStateMixin{



  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: MyPageCustomWidget.myTabs.length,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: mBackgroundColor,
              bottom: const TabBar(
                labelColor: mTextColor,
                  indicatorColor: mTextColor,
                  tabs: MyPageCustomWidget.myTabs,
              ),
            ),
            backgroundColor: mBackgroundColor,

            body:TabBarView(
              children: [
                LikePage(),
                MyClubPage()
              ],
            ),
        ),
    );

  }
}
