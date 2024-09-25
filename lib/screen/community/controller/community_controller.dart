import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/controller/dialogController.dart';
import 'package:me/screen/community/community_screen.dart';
import 'package:me/screen/main_screen.dart';

class CommunityController extends Dialogcontroller {



  void deleteComunity(uid) async{
    if(uid != null){
      await FirebaseFirestore.instance.collection('community')
          .doc(uid).delete().then(
            (doc) =>
               Get.to(MainScreen()),
        // print("Document deleted"),
        onError: (e) => print("Error updating document $e"),
      );

    } else('uid 없음');

  }




  
}