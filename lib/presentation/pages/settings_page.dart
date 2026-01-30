import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../../core/localization/localization_service.dart';

class SettingsPage extends StatelessWidget {
  final AuthController authController = Get.find();
  final LocalizationService localizationService = LocalizationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr)),
      body: ListView(
        children: [
          ListTile(
            title: Text('language'.tr),
            trailing: DropdownButton<String>(
              value: Get.locale?.languageCode == 'ar' ? 'العربية' : 'English',
              items: LocalizationService.langs.map((String lang) {
                return DropdownMenuItem(value: lang, child: Text(lang));
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  localizationService.changeLocale(newValue);
                }
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('logout'.tr, style: TextStyle(color: Colors.red)),
            onTap: () => authController.logout(),
          ),
        ],
      ),
    );
  }
}
