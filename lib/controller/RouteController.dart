import 'package:get/get.dart';

class RouteController extends GetxController{
  RxString currentPage = 'Home'.obs;

  void navigateTo(String? page) {
    currentPage.value = page!;
  }
}