import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:me/auth/onGoogle.dart';
import 'package:me/auth/onNaver.dart';
import 'package:me/controller/RouteController.dart';
import 'package:me/screen/main_screen.dart';

import '../LoginPlatform.dart';
import '../onKakao.dart';


class Authcontroller extends GetxController {

  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn();


  Rxn<User?> user = Rxn<User?>(null);


  Rx<Loginplatform> loginplatform = Loginplatform.none.obs;




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit(); // 컨트롤러가 생성될때 호출.
    user.bindStream(FirebaseAuth.instance.authStateChanges());
  }




  Future<void> Login(String platform) async {

    try{
      switch (platform){
        case 'google':
          onGoogle();
          // loginplatform.value= Loginplatform.google;

          break;


        case 'naver':

          // onNaver();
          loginplatform.value  = Loginplatform.naver;
          Get.off(MainScreen());

          break;

        case 'kakao':
          onKakao();

        break;

      }
    }catch(e){
        print('로그인 실패');
    }
  }






  Future<void> LogOut() async {



    switch(loginplatform.value){

      case Loginplatform.google:
        await _auth.signOut();
        await _googleSignIn.signOut();


        break;

      case Loginplatform.naver:
        await FlutterNaverLogin.logOut();


      case Loginplatform.kakao:
        break;
        // TODO: Handle this case.
      case Loginplatform.none:
        await _auth.signOut();
        await _googleSignIn.signOut();
        break;

        // TODO: Handle this case.
      case Loginplatform.individual:
        print('this is Not use sns login');
        break;
    }
    loginplatform.value = Loginplatform.none;
  }




}








