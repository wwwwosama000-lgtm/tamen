import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamen/app/routes/app_pages.dart'; // تأكد من استيراد هذا الملف
import 'package:tamen/app/utils/localization/app_translations.dart'; // وهذا أيضاً

// لا تنسَ تغيير 'your_project_name' إلى اسم مشروعك الفعلي

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yemeni Social Security',

      // 1. تم تصحيح الثيم هنا
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[800],
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.white), // لتلوين أيقونة القائمة في AppBar
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue[800],
          unselectedItemColor: Colors.grey[600],
          elevation: 5,
        ),
        // تم تصحيح CardTheme إلى CardThemeData
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),

      // إعدادات الترجمة
      translations: AppTranslations(),
      locale: Locale('ar', 'SA'), // اللغة الافتراضية هي العربية
      fallbackLocale: Locale('en', 'US'),

      // 2. تم تصحيح طريقة تحديد المسارات هنا
      // استخدام الطريقة الموصى بها من GetX لتجنب الأخطاء
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
