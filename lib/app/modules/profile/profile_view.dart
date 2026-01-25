import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Obx(() => Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: controller.selectedImagePath.value.isEmpty
                      ? null
                      : FileImage(File(controller.selectedImagePath.value))
                  as ImageProvider,
                  child: controller.selectedImagePath.value.isEmpty
                      ? Icon(Icons.person, size: 80, color: Colors.grey[600])
                      : null,
                ),
                InkWell(
                  onTap: controller.pickImage,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue[700],
                    child: Icon(Icons.edit, color: Colors.white, size: 20),
                  ),
                )
              ],
            )),
            SizedBox(height: 10),
            Text('Edit Profile Picture'.tr, style: TextStyle(color: Colors.grey[700])),
            SizedBox(height: 40),
            Divider(),
            ListTile(
              leading: Icon(Icons.language, color: Colors.blue[700]),
              title: Text('Change Language'.tr),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Get.defaultDialog(
                  title: 'Select Language'.tr,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text('Arabic'.tr),
                        onTap: () {
                          controller.changeLanguage('ar', 'SA');
                          Get.back();
                        },
                      ),
                      ListTile(
                        title: Text('English'.tr),
                        onTap: () {
                          controller.changeLanguage('en', 'US');
                          Get.back();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
