import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/components/drawer/drawer_controller.dart'
    as app;
import 'package:school_management_system_admin/components/drawer/drawer_model.dart';
import 'package:school_management_system_admin/resources/routes/route_names.dart';

class CustomDrawerData {
  List<DrawerModel> sideMenuItems = [
    DrawerModel(
      title: "Dashboard",
      icon: Icons.dashboard,
      onTap: () {
        Get.offAllNamed(RouteName.dashboardScreen);
      },
      isActive: false,
    ),
    DrawerModel(
      title: "Profile",
      icon: Icons.person,
      onTap: () {
        // Navigate to profile when implemented
      },
      isActive: false,
    ),
    DrawerModel(
      title: "Settings",
      icon: Icons.settings,
      onTap: () {
        // Navigate to settings when implemented
      },
      isActive: false,
    ),
    DrawerModel(
      title: "Logout",
      icon: Icons.logout,
      onTap: () {
        Get.find<app.CustomDrawerController>().logout();
      },
      isActive: false,
    ),
  ];
}
