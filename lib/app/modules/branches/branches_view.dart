import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'branches_controller.dart';

class BranchesView extends GetView<BranchesController> {
  const BranchesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: controller.branchesList.length,
        itemBuilder: (context, index) {
          final branch = controller.branchesList[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(branch.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[900])),
                  Divider(),
                  SizedBox(height: 5),
                  Row(children: [
                    Icon(Icons.location_on_outlined, size: 16, color: Colors.grey[700]),
                    SizedBox(width: 8),
                    Text("${'Address:'.tr} ${branch.address}"),
                  ]),
                  SizedBox(height: 8),
                  Row(children: [
                    Icon(Icons.phone_outlined, size: 16, color: Colors.grey[700]),
                    SizedBox(width: 8),
                    Text("${'Phone:'.tr} ${branch.phone}"),
                  ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
