
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../auth/controller/AuthController.dart';
import '../login_page/login_widget.dart';
import 'profile_widget.dart';


class MyPageScreen extends StatefulWidget {


   const MyPageScreen({super.key,});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {

  final user = Get.find<Authcontroller>().user.value;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: _getBody(user)
      );
    }
  }

  _getBody(user) {
    if(user !=null ){
      return ProfileWidget();
    } else if(user == null){
      return  LoginWidget();
    } else {
      print('로그인 or 로그아웃 실패');
      return Container();

    }
  }






