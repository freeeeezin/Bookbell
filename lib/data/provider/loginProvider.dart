import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier{

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  void logIn(){
    _isLoggedIn = true;
    notifyListeners(); //상태 변경 알림
  }

  void logOut() {
    _isLoggedIn = false;
    notifyListeners();
  }

}