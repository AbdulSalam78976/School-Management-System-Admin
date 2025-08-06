import 'package:get/get.dart';
import 'package:school_management_system_admin/components/drawer/drawer_model.dart';
import 'package:school_management_system_admin/resources/routes/route_names.dart';

class CustomDrawerData {
  List<DrawerModel> sideMenuItems = [
    DrawerModel(
      title: "Dashboard",
      icon: "assets/images/dashboard.png",
      onTap: () {
        if (Get.currentRoute != RouteName.dashboardScreen) {
          Get.offAllNamed(RouteName.dashboardScreen);
        }
      },
      isActive: false,
    ),
    DrawerModel(
      title: "Students",
      icon: "assets/images/students.png",
      onTap: () {
        Get.toNamed(RouteName.studentManagementScreen);
      },
      isActive: false,
    ),
    DrawerModel(
      title: "Teacher",
      icon: "assets/images/teacher.png",
      onTap: () {
        // Navigate to settings when implemented
      },
      isActive: false,
    ),
    DrawerModel(
      title: "Classes",
      icon: "assets/images/classes.png",
      onTap: () {
        // Navigate to settings when implemented
      },

      isActive: false,
    ),
    DrawerModel(
      title: "Chats",
      icon: "assets/images/chat.png",
      onTap: () {
        // Navigate to settings when implemented
      },
      isActive: false,
    ),

    DrawerModel(
      title: "Event & Notices",
      icon: "assets/images/megaphone.png",
      onTap: () {
        Get.toNamed(RouteName.announcementsScreen);
      },
      isActive: false,
    ),
    DrawerModel(
      title: "Fee Managemnt",
      icon: "assets/images/fees.png",
      onTap: () {
        // Navigate to settings when implemented
      },
      isActive: false,
    ),
  ];
}
