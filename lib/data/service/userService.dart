import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me/data/firebaseService.dart';

import '../../auth/controller/AuthController.dart';
import '../dto/Book.dart';

class Userservice extends FirebaseService with ChangeNotifier{

  final Authcontroller controller = Get.find<Authcontroller>();

  Userservice() : super('users');

  final FirebaseAuth _auth = FirebaseAuth.instance;



  //get User
  Future<DocumentSnapshot> getUser (String uid) async{
    return await db.collection(collectionPath).doc(uid).get();
  }

  //get User like-list
  Future<bool> getLikeList(String email) async {
    // Query the users collection
    QuerySnapshot querySnapshot = await db.collection(collectionPath).where('email',isEqualTo: email).get();

    // QuerySnapshot의 문서를 List<Map<String, dynamic>> 형태로 변환
    List<Map<String, dynamic>> usersList = querySnapshot.docs.map((doc) {
      return {
        'id': doc.id, // 문서 ID 추가
        ...doc.data() as Map<String, dynamic>, // 문서 데이터 추가
      };
    }).toList();

    return usersList.first['like_list'][9]['isLike'];

    print(usersList.first['like_list'][9]['isLike']);


  }
  //add User
  Future<bool> addUser(Map<String,dynamic> data) async {
   print(data);
    try{
      await db.collection(collectionPath).add(data).then(
          (DocumentReference docRef){
            String docUID = docRef.id;
            docRef.update({
             'uid':docUID
            }).then((_) {
              print('uid 자동생성 및 저장 완로');
            }).catchError((error){
              print('UID 자동생성 오류발생: ${error}');
            });
          }
      );
      print('!!사용자 회원가입 성공!!');
      return true;
    }catch(e){
      print('사용자 저장 실패 ${e}');
      return false;
    }
  }


  //update User
  Future<void> updateUser (String uid, Map<String,dynamic> data )async {
    await db.collection(collectionPath).doc(uid).update(data);
  }

  //delete User
  Future<void> deleteUser(String uid) async {
    await db.collection(collectionPath).doc(uid).delete();
  }

  Future<void> addLikeListbyUser (Book bookInfo, String? email) async{

   Map<String,dynamic> bookJson = bookInfo.toJson();


   try{
    CollectionReference users = db.collection(collectionPath);
    QuerySnapshot querySnapshot = await users.where('email',isEqualTo: email).get();
    List<dynamic> items =[];


    items.add(bookJson);


     for( var doc in querySnapshot.docs){
       await users.doc(doc.id).update({
         'like_list': FieldValue.arrayUnion(items)
       });
     }


   }catch(e){
      print('error');
   }


  }

  Future<void> removeItemFromList (Book bookInfo, String? email) async{

    Map<String,dynamic> bookJson = bookInfo.toJson();

    try{
      CollectionReference users = db.collection(collectionPath);
      QuerySnapshot querySnapshot = await users.where('email',isEqualTo: email).get();

      bookJson['isLike'] = true;

      List<dynamic> remove_items = [];

      Map<String,dynamic> data = bookJson;

      remove_items = [data];

      for( var doc in querySnapshot.docs){
        await users.doc(doc.id).update({
          'like_list': FieldValue.arrayRemove(remove_items)
        });
      }


    }catch(e){
      print('Failed Remove like_list');
    }


  }

  Future<void> validateUser (String email ) async {
    try {

      db.collection(collectionPath).where("email", isEqualTo: email).get().then(
            (querySnapshot) {
          print("Successfully completed");
          // print(querySnapshot.docs.passw)


        },
        onError: (e) => print("Error completing: $e"),
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('사용자를 찾을 수 없습니다.');
      } else if (e.code == 'wrong-password') {
        print('비밀번호가 잘못되었습니다.');
      }
    } catch (e) {
      print('로그인 중 오류 발생: $e');
    }



  }

  // Future<bool> validate(String isbn) async {
  //   String? email = controller.user.value!.email;
  //   bool result = false;
  //
  //   QuerySnapshot querySnapshot = await db.collection('users').where('email',isEqualTo: email).get();
  //
  //   // QuerySnapshot의 문서를 List<Map<String, dynamic>> 형태로 변환
  //   List<Map<String, dynamic>> usersList = querySnapshot.docs.map((doc) {
  //     return {
  //       'id': doc.id, // 문서 ID 추가
  //       ...doc.data() as Map<String, dynamic>, // 문서 데이터 추가
  //     };
  //   }).toList();
  //
  //   List<dynamic> items = usersList.first['like_list'];
  //
  //   String keyToCheck= 'isbn';
  //
  //   for (var item in items) {
  //     if (item.containsKey(keyToCheck)) {
  //       print('isbn value: ${item[keyToCheck]}');
  //
  //       if(item[keyToCheck] == isbn){
  //         _isvalue = true;
  //       }
  //
  //     } else {
  //       print('Item: $item does not have key "$keyToCheck".');
  //       _isvalue = false;
  //     }
  //   }
  //
  //   return result;
  //
  //
  // }
  //


}