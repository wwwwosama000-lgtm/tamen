import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../../core/theme/app_theme.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.find();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.primaryColor, AppTheme.primaryColor.withOpacity(0.8)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Icon(Icons.restaurant_menu, size: 80, color: Colors.white),
                SizedBox(height: 16),
                Text(
                  'app_title'.tr,
                  style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Text(
                          'login'.tr,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.secondaryColor),
                        ),
                        SizedBox(height: 24),
                        TextField(
                          controller: userController,
                          decoration: InputDecoration(
                            labelText: 'username'.tr,
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: passController,
                          decoration: InputDecoration(
                            labelText: 'password'.tr,
                            prefixIcon: Icon(Icons.lock_outline),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () async {
                            bool success = await authController.login(userController.text, passController.text);
                            if (success) {
                              Get.offAllNamed('/home');
                            } else {
                              Get.snackbar('error'.tr, 'Invalid credentials', 
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white);
                            }
                          },
                          child: Text('login'.tr, style: TextStyle(fontSize: 18)),
                        ),
                        SizedBox(height: 16),
                        TextButton(
                          onPressed: () => Get.toNamed('/register'),
                          child: Text('register'.tr, style: TextStyle(color: AppTheme.primaryColor)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
