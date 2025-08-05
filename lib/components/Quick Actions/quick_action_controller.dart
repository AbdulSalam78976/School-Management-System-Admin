// controllers/quick_action_controller.dart
import 'package:get/get.dart';
import 'package:school_management_system_admin/components/Quick%20Actions/quick_action_model.dart';
import 'package:flutter/material.dart';

class QuickActionController extends GetxController {
  var quickActions = <QuickAction>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadActions();
  }

  void loadActions() {
    quickActions.value = [
      QuickAction(
        icon: 'assets/images/add.png',
        title: 'Add Student',
        onTap: () => debugPrint("Add Student tapped"),
      ),
      QuickAction(
        icon: 'assets/images/add.png',
        title: 'Add Teacher',
        onTap: () => debugPrint("Add Teacher tapped"),
      ),
      QuickAction(
        icon: 'assets/images/announcement.png',
        title: 'Add Announcement',

        onTap: () => debugPrint("Mark Attendance tapped"),
      ),
      QuickAction(
        icon: 'assets/images/classes.png',
        title: 'View Classes',
        onTap: () => debugPrint("View Classes tapped"),
      ),
      QuickAction(
        icon: 'assets/images/classes.png',
        title: 'View Classes',
        onTap: () => debugPrint("View Classes tapped"),
      ),
    ];
  }
}
