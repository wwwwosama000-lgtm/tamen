import 'package:get/get.dart';
import 'package:tamen/app/modules/branches/branches_controller.dart';
import 'package:tamen/app/modules/home/home_controller.dart';
import 'package:tamen/app/modules/profile/profile_controller.dart';
import 'package:tamen/app/modules/services/services_controller.dart';

class DashboardController extends GetxController {
  var tabIndex = 0.obs;

  final List<String> pageTitles = [
    'Home',
    'Services',
    'Branches',
    'Profile',
  ];

  // لتغيير عنوان AppBar
  String get currentPageTitle => pageTitles[tabIndex.value].tr;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update(); // لتحديث العنوان
  }

  @override
  void onInit() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ServicesController>(() => ServicesController());
    Get.lazyPut<BranchesController>(() => BranchesController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    super.onInit();
  }
}
