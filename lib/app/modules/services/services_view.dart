import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: controller.servicesList.length,
        itemBuilder: (context, index) {
          final service = controller.servicesList[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: Icon(Icons.verified_user_outlined, color: Colors.blue[700]),
              title: Text(service.title, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(service.description),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
