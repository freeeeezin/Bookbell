import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:me/data/firebaseService.dart';

import '../../../auth/controller/AuthController.dart';
import '../../../auth/onGoogle.dart';
import '../../../controller/dialogController.dart';
import '../../../data/dto/Book.dart';

class LikeModel with ChangeNotifier  {
  final Authcontroller controller = Get.find<Authcontroller>();
  final Dialogcontroller dialogController = Get.find<Dialogcontroller>();
  FirebaseService service = FirebaseService('users');

  bool _isLiked = false;
  bool get isLiked => _isLiked;

  String uid = '';



  void likeStatus(Book book) {
    uid = controller.user.value!.uid;
    userService.getUser(uid);

    if(controller.user.value != null ){

      _isLiked =! _isLiked;
      notifyListeners();


      if(_isLiked == true){
        book.isLike = true;
        userService.addLikeListbyUser(book, controller.user.value?.email);
      }else {
        book.isLike = false;
        userService.removeItemFromList(book, controller.user.value?.email);
        // deleteLikeListbyUser(book, controller.user.value?.email);
      }

    }else{
      dialogController.showdialog();
    }
  }

  void like() {
    String uid = controller.user.value!.uid;

    if(controller.user.value != null ){
      _isLiked =! _isLiked;
      notifyListeners();


    }else{
      dialogController.showdialog();
    }
  }


















  Future<bool> getLikeList(String email) async {
    // Query the users collection
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').where('email',isEqualTo: email).get();

    // QuerySnapshot의 문서를 List<Map<String, dynamic>> 형태로 변환
    List<Map<String, dynamic>> usersList = querySnapshot.docs.map((doc) {
      return {
        'id': doc.id, // 문서 ID 추가
        ...doc.data() as Map<String, dynamic>, // 문서 데이터 추가
      };
    }).toList();

    return usersList.first['like_list'][9]['isLike'];






  }
}