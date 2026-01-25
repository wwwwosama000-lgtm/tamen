import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var selectedImagePath = ''.obs;

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImagePath.value = image.path;
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void changeLanguage(String langCode, String countryCode) {
    var locale = Locale(langCode, countryCode);
    Get.updateLocale(locale);
  }
}
