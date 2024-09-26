import 'dart:core';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../auth/controller/AuthController.dart';
import '../../../auth/onGoogle.dart';
import '../../../controller/dialogController.dart';
import '../../../data/dto/Book.dart';

class LikeModel with ChangeNotifier {
  final Authcontroller controller = Get.find<Authcontroller>();
  final Dialogcontroller dialogController = Get.find<Dialogcontroller>();

  bool _isLiked = false;
  bool get isLiked => _isLiked;
  
  void likeStatus(Book book) {
    String uid = controller.user.value!.uid;

    if(controller.user.value != null ){
      _isLiked =! _isLiked;
      notifyListeners();

      if(_isLiked == true){
        userService.addLikeListbyUser(book, controller.user.value?.email);
      }else {
        userService.deleteLikeListbyUser(book,uid);
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
}