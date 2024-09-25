import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:me/data/firebaseService.dart';

class CommunityService extends FirebaseService {
  CommunityService() : super('community');

  // Future<List<String>> likeList (String email) async{
  //   List<String> like_list = [];
  //   try{
  //     QuerySnapshot snapshot =
  //     await  db.collection(collectionPath).where('email', isEqualTo: email).get();
  //
  //     if (snapshot.docs.isNotEmpty) {
  //       var data = snapshot.docs.first.data() as Map<String, dynamic>;
  //
  //       like_list = data['like_list'];
  //
  //       return like_list;
  //
  //     } else {
  //       print('해당 이메일을 가진 클럽을 찾을 수 없습니다.');
  //     }
  //
  //   }catch(e){
  //     print(e);
  //   }
  //
  //
  //
  // }


}