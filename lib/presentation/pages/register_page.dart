import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthController authController = Get.find();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  String selectedRole = 'Viewer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('register'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: userController, decoration: InputDecoration(labelText: 'username'.tr)),
            TextField(controller: passController, decoration: InputDecoration(labelText: 'password'.tr), obscureText: true),
            DropdownButton<String>(
              value: selectedRole,
              items: ['Admin', 'Chef', 'Viewer'].map((String role) {
                return DropdownMenuItem(value: role, child: Text(role.tr));
              }).toList(),
              onChanged: (value) => setState(() => selectedRole = value!),
            ),
            ElevatedButton(
              onPressed: () async {
                bool success = await authController.register(userController.text, passController.text, selectedRole);
                if (success) {
                  Get.back();
                  Get.snackbar('success'.tr, 'Account created');
                } else {
                  Get.snackbar('error'.tr, 'Username already exists');
                }
              },
              child: Text('register'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
