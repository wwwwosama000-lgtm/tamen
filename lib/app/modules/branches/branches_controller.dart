import 'package:get/get.dart';

class Branch {
  final String name;
  final String address;
  final String phone;
  Branch({required this.name, required this.address, required this.phone});
}

class BranchesController extends GetxController {
  final List<Branch> branchesList = [
    Branch(name: 'Sana\'a Branch'.tr, address: '60th Street', phone: '01-xxxxxx'),
    Branch(name: 'Aden Branch'.tr, address: 'Mualla Street', phone: '02-xxxxxx'),
    Branch(name: 'Taiz Branch'.tr, address: 'Gamal Street', phone: '04-xxxxxx'),
    Branch(name: 'Hodeidah Branch'.tr, address: 'Sana\'a Street', phone: '03-xxxxxx'),
  ];
}
