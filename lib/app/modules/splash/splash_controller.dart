import 'dart:async';
import 'package:get/get.dart';
import 'package:tamen/app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.DASHBOARD);
    });
  }
}
