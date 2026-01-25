import 'package:get/get.dart';

class Service {
  final String title;
  final String description;
  Service({required this.title, required this.description});
}

class ServicesController extends GetxController {
  final List<Service> servicesList = [
    Service(title: 'Old-age, disability, and death insurance'.tr, description: '...'),
    Service(title: 'Work injury insurance'.tr, description: '...'),
    Service(title: 'Health insurance'.tr, description: '...'),
    Service(title: 'Unemployment insurance'.tr, description: '...'),
  ];
}
