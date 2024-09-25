import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:me/auth/controller/AuthController.dart';
import 'package:me/data/service/userService.dart';
import 'package:me/screen/myPage/main_screen.dart';

import '../controller/RouteController.dart';
import '../screen/main_screen.dart';
import 'LoginPlatform.dart';

  // Authcontroller controller = Authcontroller();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Rx<Loginplatform> loginplatform = Loginplatform.none.obs;
  Userservice userService = Userservice();


Future<void> onGoogle() async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    GoogleSignIn _googleSignIn = GoogleSignIn();


    final googleUser = await _googleSignIn.signIn();

    if(googleUser == null) return;

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken
    );

    UserCredential userCredential =await _auth.signInWithCredential(credential);

     if(userCredential.additionalUserInfo?.isNewUser ?? false) {


      List<Map<String,dynamic>> like_list = [];
      Map<String,dynamic> data = {
        "uid": googleUser.id,
        "email" : googleUser.email,
        "displayName" : googleUser.displayName,
        "photoURL":googleUser.photoUrl,
        "like_list": like_list,
        "createdAt": DateTime.now(),
      };

      userService.addUser(data);

     }

    loginplatform.value = Loginplatform.google;
    Get.off(MainScreen());


  }




  Future<void> saveUser( dynamic credential, UserCredential userCredential) async{
    User? user = userCredential.user;
    if(userCredential.additionalUserInfo?.isNewUser ?? false) {
      await _firestore.collection('users').doc(user!.uid).set({
        'uid':user.uid,
        'email':user.email,
        'name':user.displayName,
        'photoUrl':user.photoURL,
        'createdAt': Timestamp.now()
      });
    } else {
      Get.find<RouteController>().currentPage.value=='MyPage';
      Get.off(MainScreen(), arguments: user);
    }


}