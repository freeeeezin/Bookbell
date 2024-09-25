import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import '../auth/controller/AuthController.dart';
import 'component/icons_actions.dart';
import 'main_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}



class _FirstScreenState extends State<FirstScreen> {

  final Authcontroller controller = Get.find<Authcontroller>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUserLogged();
  }


  void checkUserLogged(){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('${controller.loginplatform}');
        print('User is currently signed out!');
      } else {
        print('${controller.loginplatform}');
        print('User is signed in!');
        print('${controller.loginplatform}');

      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: MainScreen()
    );
  }
}

