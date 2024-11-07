import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:me/data/firebaseService.dart';
import 'package:me/data/service/userService.dart';

import '../../../auth/controller/AuthController.dart';
import '../../../auth/onGoogle.dart';
import '../../../controller/dialogController.dart';
import '../../../data/dto/Book.dart';

class LikeModel with ChangeNotifier  {
  final Authcontroller controller = Get.find<Authcontroller>();
  final Dialogcontroller dialogController = Get.find<Dialogcontroller>();
  Userservice userService = Userservice();


  bool _isLiked = false;
  bool get isLiked => _isLiked;

  String uid = '';
  String isb = '';

  List<Map<String, dynamic>> usersList = [];
  List<dynamic> bookList = [];
  bool result = true;






  void likeStatus(Book book, itm)  {
    uid = controller.user.value!.uid;


    if(controller.user.value != null ){

      itm != itm;
      notifyListeners();


      if(itm == true){
        book.isLike = true;

        userService.addLikeListbyUser(book, controller.user.value?.email);

      }else {
        book.isLike = false;

        notifyListeners();
        userService.removeItemFromList(book, controller.user.value?.email);

      }

    }else{
      dialogController.showdialog();
    }
  }
  List<dynamic> _itmes = [];
  bool aaa = false;


  void toggleLike(int index, dynamic itemList) {

   _itmes.add(itemList);
    aaa = _itmes[index]['isLiked'];
    aaa =! aaa;
    notifyListeners();
    // 상태 변경 후 UI 업데이트 요청
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




  Future<bool> validate(String isbn) async {
    String? email = controller.user.value!.email;


    QuerySnapshot querySnapshot = await  FirebaseFirestore.instance.collection('users').where('email',isEqualTo: email).get();

    // QuerySnapshot의 문서를 List<Map<String, dynamic>> 형태로 변환
    usersList = querySnapshot.docs.map((doc) {
      return {
        'id': doc.id, // 문서 ID 추가
        ...doc.data() as Map<String, dynamic>, // 문서 데이터 추가
      };
    }).toList();

    List<dynamic> items = usersList.first['like_list'];

    String keyToCheck= 'isbn';

    for (var item in items) {
      if (item.containsKey(keyToCheck)) {
        print('isbn value: ${item[keyToCheck]}');

        if(item[keyToCheck] == isbn){
          bookList.add(item);
          isb= isbn;

          result = true;
        }

      } else {
        print('Item: $item does not have key "$keyToCheck".');
        result = false;
      }
    }

    return result;


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

    usersList.first['like_list'];

    return usersList.first['like_list'];






  }
}