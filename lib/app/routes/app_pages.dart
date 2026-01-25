import 'package:get/get.dart';
// تأكد من استيراد كل الصفحات والـ bindings الخاصة بها
import 'package:tamen/app/modules/dashboard/dashboard_binding.dart';
import 'package:tamen/app/modules/dashboard/dashboard_view.dart';
import 'package:tamen/app/modules/splash/splash_binding.dart';
import 'package:tamen/app/modules/splash/splash_view.dart';
// استيراد ملف أسماء المسارات
import 'app_routes.dart';

// لا تنسَ تغيير 'your_project_name' إلى اسم مشروعك الفعلي

class AppPages {
  // 1. تعريف المسار الأولي (صفحة البداية)
  // ملف main.dart سيستخدم هذا المتغير
  static const INITIAL = AppRoutes.SPLASH;

  // 2. قائمة بجميع صفحات التطبيق
  // ملف main.dart سيستخدم هذه القائمة
  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn, // يمكنك إضافة تأثير انتقال
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
      transition: Transition.rightToLeftWithFade, // تأثير انتقال مختلف
    ),
    // يمكنك إضافة صفحات أخرى هنا في المستقبل بنفس الطريقة
    // مثلاً:
    // GetPage(
    //   name: AppRoutes.LOGIN,
    //   page: () => LoginView(),
    //   binding: LoginBinding(),
    // ),
  ];
}
