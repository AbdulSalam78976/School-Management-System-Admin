import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/components/drawer/drawer_model.dart';
import 'package:school_management_system_admin/resources/routes/route_names.dart';

class CustomDrawerData {
  List<DrawerModel> sideMenuItems = [
    DrawerModel(
      title: "Dashboard",
      icon: Icons.dashboard,
      onTap: () {
        if (Get.currentRoute != RouteName.dashboardScreen) {
          Get.offAllNamed(RouteName.dashboardScreen);
        }
      },
      isActive: false,
    ),
    DrawerModel(
      title: "Students",
      icon: Icons.person,
      onTap: () {
        // Navigate to profile when implemented
      },
      isActive: false,
    ),
    DrawerModel(
      title: "Teacher",
      icon: Icons.person,
      onTap: () {
        // Navigate to settings when implemented
      },
      isActive: false,
    ),
    DrawerModel(
      title: "Classes",
      icon: Icons.person,
      onTap: () {
        // Navigate to settings when implemented
      },

      isActive: false,
    ),
    DrawerModel(
      title: "Chats",
      icon: Icons.menu_book,
      onTap: () {
        // Navigate to settings when implemented
      },
      isActive: false,
    ),
    DrawerModel(
      title: "Attendance",
      icon: Icons.person,
      onTap: () {
        // Navigate to settings when implemented
      },
      isActive: false,
    ),

    DrawerModel(
      title: "Event & Notices",
      icon: Icons.person,
      onTap: () {
        // Navigate to settings when implemented
      },
      isActive: false,
    ),
    DrawerModel(
      title: "Fee Managemnt",
      icon: Icons.person,
      onTap: () {
        // Navigate to settings when implemented
      },
      isActive: false,
    ),
  ];
}
