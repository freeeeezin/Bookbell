import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:me/data/firebaseService.dart';

import '../dto/Book.dart';

class Userservice extends FirebaseService with ChangeNotifier{

  Userservice() : super('users');

  final FirebaseAuth _auth = FirebaseAuth.instance;


  //get User
  Future<DocumentSnapshot> getUser (String uid) async{
    return await db.collection(collectionPath).doc(uid).get();
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


  Future<void> addLikeListbyUser (Book bookInfo , String ? email) async{


   Map<String,dynamic> bookJson = bookInfo.toJson();
   print(bookJson);

   // try{
   //  CollectionReference users = db.collection(collectionPath);
   //  QuerySnapshot querySnapshot = await users.where('email',isEqualTo: email).get();
   //  List<dynamic> items =[];
   //  items.add(data);
   //
   //   for( var doc in querySnapshot.docs){
   //     await users.doc(doc.id).update({
   //       'like_list': FieldValue.arrayUnion(items)
   //     });
   //   }
   //
   //
   //
   //
   // }catch(e){
   //
   // }


  }

  Future<void> deleteLikeListbyUser (Map<String,dynamic> bookInfo, String uid) async{

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




}