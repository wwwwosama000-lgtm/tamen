import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService extends Translations {
  static final locale = Locale('ar', 'SA');
  static final fallbackLocale = Locale('en', 'US');
  static final langs = ['English', 'العربية'];
  static final locales = [Locale('en', 'US'), Locale('ar', 'SA')];

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'app_title': 'Recipe App',
      'login': 'Login',
      'register': 'Register',
      'username': 'Username',
      'password': 'Password',
      'role': 'Role',
      'admin': 'Admin',
      'chef': 'Chef',
      'viewer': 'Viewer',
      'add_recipe': 'Add Recipe',
      'edit_recipe': 'Edit Recipe',
      'delete': 'Delete',
      'save': 'Save',
      'logout': 'Logout',
      'settings': 'Settings',
      'language': 'Language',
      'arabic': 'Arabic',
      'english': 'English',
      'recipe_name': 'Recipe Name',
      'ingredients': 'Ingredients',
      'instructions': 'Instructions',
      'no_recipes': 'No recipes found',
      'unauthorized': 'Unauthorized access',
      'success': 'Success',
      'error': 'Error',
      'favorites': 'Favorites',
      'no_favorites': 'No favorites yet',
      'added_to_favorites': 'Added to favorites',
      'removed_from_favorites': 'Removed from favorites'
    },
    'ar_SA': {
      'app_title': 'تطبيق الوصفات',
      'login': 'تسجيل الدخول',
      'register': 'إنشاء حساب',
      'username': 'اسم المستخدم',
      'password': 'كلمة المرور',
      'role': 'الدور',
      'admin': 'مدير',
      'chef': 'طاهٍ',
      'viewer': 'متصفح',
      'add_recipe': 'إضافة وصفة',
      'edit_recipe': 'تعديل الوصفة',
      'delete': 'حذف',
      'save': 'حفظ',
      'logout': 'تسجيل الخروج',
      'settings': 'الإعدادات',
      'language': 'اللغة',
      'arabic': 'العربية',
      'english': 'الإنجليزية',
      'recipe_name': 'اسم الوصفة',
      'ingredients': 'المكونات',
      'instructions': 'التعليمات',
      'no_recipes': 'لا توجد وصفات',
      'unauthorized': 'وصول غير مصرح به',
      'success': 'تم بنجاح',
      'error': 'خطأ',
      'favorites': 'المفضلة',
      'no_favorites': 'لا توجد مفضلات بعد',
      'added_to_favorites': 'تمت الإضافة للمفضلة',
      'removed_from_favorites': 'تم الحذف من المفضلة'
    }
  };

  void changeLocale(String lang) async {
    final locale = _getLocaleFromLang(lang);
    Get.updateLocale(locale);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', lang);
  }

  Locale _getLocaleFromLang(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
