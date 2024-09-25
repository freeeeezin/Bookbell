import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../auth/controller/AuthController.dart';
import '../../../auth/onGoogle.dart';
import '../../../controller/dialogController.dart';
import '../../../data/dto/Book.dart';

class LikeModel with ChangeNotifier {
  final Authcontroller controller = Get.find<Authcontroller>();
  final Dialogcontroller dialogController = Get.find<Dialogcontroller>();

  bool _isLike  = false;

  bool get isLike => _isLike;

  void toggleFavorite(Book bookInfo){
    if(controller.user.value != null ){

      _isLike = !_isLike;
      bookInfo.isLike = true;
      notifyListeners();

    }else{
      dialogController.showdialog();
    }


  }
}