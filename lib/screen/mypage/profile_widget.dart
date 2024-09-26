import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../constants.dart';
import '../../auth/controller/AuthController.dart';
import 'mypage_custom_widget.dart';

class ProfileWidget extends StatefulWidget {

  Map<String,dynamic> ? data;

  ProfileWidget({super.key ,this.data,});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();

}

class _ProfileWidgetState extends State<ProfileWidget> {

  final Authcontroller controller = Get.find<Authcontroller>();

  @override
  Widget build(BuildContext context) {
    String photoURL = controller.user.value!.photoURL.toString();
    return Container(

        color: mBackgroundColor,
        child: Column(children: [
           Row(
              children: [
                Expanded(
                  flex: 1,
                  child:  Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Stack(children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              '$photoURL'
                          ),
                        ),
                      ]),
                    ),
                  ]),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text( '${controller.user.value!.displayName}',
                        style: TextStyle(fontSize: 18, color: Colors.black,
                        decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal
                        ),
                        ),
                        Text('${controller.user.value!.email}',
                            style: TextStyle(fontSize: 18, color: Colors.black,
                            decoration: TextDecoration.none,
                       fontWeight: FontWeight.normal
                            ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.grey[300]
                                ),
                                onPressed: () async{
                                  controller.LogOut();
                                },
                                child: Text('로그아웃'))
                        ),



                      ],
                    ),
                  ),
                ),
              ],
            ),
           Expanded(
             flex: 10,
               child: MyPageCustomWidget())

        ])
    );
  }
}
