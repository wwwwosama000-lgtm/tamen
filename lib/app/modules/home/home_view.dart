import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // السلايدر الإخباري
          Text('Latest News'.tr, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[900])),
          SizedBox(height: 8),
          SizedBox(
            height: 180.0,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AnotherCarousel(
                images: controller.newsImages.map((url) => NetworkImage(url)).toList(),
                dotSize: 5.0,
                dotSpacing: 15.0,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.black.withOpacity(0.3),
                borderRadius: false,
                autoplay: true,
              ),
            ),
          ),
          SizedBox(height: 24),

          // قسم الاستعلام
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Inquiry about a subscriber'.tr, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[900])),
                  SizedBox(height: 16),
                  TextField(
                    controller: controller.inquiryController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter your insurance number'.tr,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_search),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.performInquiry,
                      child: Text('Inquiry'.tr),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
