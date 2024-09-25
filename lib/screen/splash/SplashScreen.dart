import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:me/constants.dart';
import 'package:me/screen/first_screen.dart';
import 'package:me/screen/splash/components/splashwithRive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 200,
              width: 400,
              child: splashwithRive()),
        ],
      ),
    );
  }

  Future<void> _navigateToHome() async{
    await Future.delayed(const Duration(seconds: 4), () {
      Get.off(const FirstScreen(),
      transition: Transition.fade,
      duration: const Duration(seconds: 3));
    });

  }
}
