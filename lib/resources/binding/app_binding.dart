import 'package:get/get.dart';
import 'package:school_management_system_admin/components/drawer/drawer_controller.dart';
import 'package:school_management_system_admin/screens/login/login_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CustomDrawerController(), permanent: true);
    Get.put(LoginController(), permanent: true);
  }
}
