import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamen/app/modules/branches/branches_view.dart';
import 'package:tamen/app/modules/home/home_view.dart';
import 'package:tamen/app/modules/profile/profile_view.dart';
import 'package:tamen/app/modules/services/services_view.dart';
import 'package:tamen/app/utils/widgets/app_drawer.dart';
import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeView(),
      ServicesView(),
      BranchesView(),
      ProfileView(),
    ];

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: GetBuilder<DashboardController>(
          builder: (_) => Text(controller.currentPageTitle),
        ),
        centerTitle: true,
      ),
      body: Obx(() => IndexedStack(
        index: controller.tabIndex.value,
        children: pages,
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.tabIndex.value,
        onTap: controller.changeTabIndex,
        type: BottomNavigationBarType.fixed, // ليظهر الـ label دائماً
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'.tr),
          BottomNavigationBarItem(icon: Icon(Icons.miscellaneous_services), label: 'Services'.tr),
          BottomNavigationBarItem(icon: Icon(Icons.location_city), label: 'Branches'.tr),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'.tr),
        ],
      )),
    );
  }
}
