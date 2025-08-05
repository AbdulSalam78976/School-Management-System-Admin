import 'package:get/get.dart';
import 'package:school_management_system_admin/components/drawer/drawer_model.dart';
import 'package:school_management_system_admin/resources/routes/route_names.dart';

class CustomDrawerController extends GetxController {
  final RxList<DrawerModel> items = <DrawerModel>[].obs;
  final RxInt activeIndex = 0.obs;

  void setItems(List<DrawerModel> drawerItems) {
    items.assignAll(drawerItems);
  }

  void setActiveIndex(int index) {
    activeIndex.value = index;
    for (int i = 0; i < items.length; i++) {
      items[i] = items[i].copyWith(isActive: i == index);
    }
  }

  void logout() {
    Get.offAllNamed(RouteName.loginScreen);
  }
}
