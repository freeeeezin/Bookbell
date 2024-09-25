import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/constants.dart';
import 'package:me/screen/community/community_screen.dart';
import 'package:me/screen/community/controller/community_controller.dart';
import 'package:me/screen/home/home_screen.dart';
import 'package:me/screen/login_page/login_widget.dart';
import 'package:me/screen/mypage/profile_widget.dart';

import '../common/screen/appbar_screen.dart';
import '../auth/controller/AuthController.dart';
import '../controller/RouteController.dart';
import 'myPage/main_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();


}




class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final Authcontroller authcontroller = Get.find<Authcontroller>();
    final RouteController routeController = Get.put(RouteController());
    final CommunityController communityController = Get.put(CommunityController());

    return Scaffold(
      appBar:  PreferredSize(preferredSize: Size.fromHeight(40),
    child: AppbarScreen(false)
    ),
      body: Obx(() {
        if (routeController.currentPage =='Home'){
          return const HomeScreen();

        } else if (routeController.currentPage =='Community'){
          return const CommunityScreen();

        }else if (routeController.currentPage == 'MyPage'){
          return authcontroller.user.value != null ? ProfileWidget() : LoginWidget();



        } else return HomeScreen();
      })
        ,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: mTextColor,
        currentIndex: _selectedIndex,
        onTap: onTaped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book),label: "book"),
          BottomNavigationBarItem(icon: Icon(Icons.speaker_notes),label: "Community"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "MyPage")
        ],

      )
    );

  }

  void onTaped(int value) {
    setState(() {
      _selectedIndex = value;
      switch(value){
        case 0:   Get.find<RouteController>().navigateTo('Home');
        break;
        case 1:   Get.find<RouteController>().navigateTo('Community');
        break;
        case 2: Get.find<RouteController>().navigateTo('MyPage');
      }

    });
  }


}
