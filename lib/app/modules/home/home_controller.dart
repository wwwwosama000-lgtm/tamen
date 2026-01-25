import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final inquiryController = TextEditingController();

  // قائمة صور وهمية للسلايدر
  final List<String> newsImages = [
    'https://via.placeholder.com/600x300/0000FF/FFFFFF?Text=News+1',
    'https://via.placeholder.com/600x300/00008B/FFFFFF?Text=News+2',
    'https://via.placeholder.com/600x300/4169E1/FFFFFF?Text=News+3',
  ];

  void performInquiry( ) {
    if (inquiryController.text == "12345") {
      Get.defaultDialog(
        title: "Subscriber Data".tr,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${'Name:'.tr} ${'Mohammed Abdullah'.tr}"),
            Text("${'Status:'.tr} ${'Active'.tr}"),
          ],
        ),
      );
    } else {
      Get.snackbar(
        "Inquiry about a subscriber".tr,
        "Subscriber not found.".tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    inquiryController.dispose();
    super.onClose();
  }
}
