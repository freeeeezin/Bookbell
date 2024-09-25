// import 'dart:convert';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_naver_login/flutter_naver_login.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
//
//  Future<void> onNaver() async {
//
//   NaverLoginResult _result = await FlutterNaverLogin.logIn();
//
//
//   if(_result.status == NaverLoginStatus.loggedIn){
//    print('accessToken : ${_result.accessToken}');
//    print('id : ${_result.account.id}');
//    print(' email : ${_result.account.email}');
//    print('name : ${_result.account.name}');
//
//   } else {
//    print('naver 실패');
//   }
//
//   saveUser(_result.accessToken);
//  }
//
//
//   Future<void> saveUser(NaverAccessToken accessToken) async {
//    try{
//     // await signInWithFirebase
//    }catch(e){
//     print('로그인 실패');
//    }
//   }
//
//
// // Future<void> signInWithFirebase(String naverAccessToken) async {
// //  final String firebaseAuthUrl = 'YOUR_CLOUD_FUNCTION_URL';
// //
// //  final response = await http.post(
// //   Uri.parse(firebaseA  uthUrl),
// //   headers: {'Content-Type': 'application/json'},
// //   body: json.encode({'token': naverAccessToken}),
// //  );
// //
// //  if (response.statusCode == 200) {
// //   final customToken = json.decode(response.body)['firebase_token'];
// //   await FirebaseAuth.instance.signInWithCustomToken(customToken);
// //  } else {
// //   print('Failed to sign in with Firebase');
// //  }
// // }
//
