import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/screen/first_screen.dart';
import 'package:rive/rive.dart';
import 'package:velocity_x/velocity_x.dart';

class splashwithRive extends StatefulWidget {
  const splashwithRive(
      {super.key,});


  @override
  State<splashwithRive> createState() => _splashwithRiveState();
}

class _splashwithRiveState extends State<splashwithRive> {
  late StateMachineController controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
          child: GestureDetector(
            onTap: (){
              Future.delayed(Duration(seconds: 2), () {
                Get.to(FirstScreen());
              });

            },
            child: RiveAnimation.asset(
              "assets/rive/book_loading.riv",
              stateMachines: ['State Machine 1'],
              onInit: (Artboard art) {
                controller = StateMachineController.fromArtboard(art, 'State Machine 1')!;
                controller.isActive = true;
              },
              fit: BoxFit.cover,
            ),
          ),



    );
  }
}


