import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/community/controller/community_controller.dart';

class Dialogcontroller extends GetxController {


  void showdialog() {
    Get.defaultDialog(
        title: '알림',
        middleText: '로그인이 필요한 서비스입니다.',
        textConfirm: '확인',
        onConfirm: (){
          Get.back();
        }
    );
  }

  void deldialogCommunity(uid){

    try{
      CommunityController controller = CommunityController();
      Get.defaultDialog(
          title: '알림',
          middleText: '삭제하시겠습니까?',
          textConfirm: '네',
          textCancel: '취소',
          onConfirm: (){
            controller.deleteComunity(uid);
            Get.back();

          }
      );

    }catch(e){
      print("Delete failed");

    }


  }


  void showLike(){

    try{

      Get.defaultDialog(
          title: '알림',
          middleText: '관심도서가 변경되었습니다.',


      );

    }catch(e){
      print("Delete failed");

    }

  }



}