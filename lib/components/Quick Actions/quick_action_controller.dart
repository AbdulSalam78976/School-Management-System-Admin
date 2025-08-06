// controllers/quick_action_controller.dart
import 'package:get/get.dart';
import 'package:school_management_system_admin/components/Quick%20Actions/quick_action_model.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system_admin/resources/routes/route_names.dart';
import 'package:school_management_system_admin/screens/announcements/add_announcement.dart';
import 'package:school_management_system_admin/screens/student/add_student.dart';
import 'package:school_management_system_admin/screens/teacher/add_teacher.dart';

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
        onTap: () {
          showAddStudentDialog();
        },
      ),
      QuickAction(
        icon: 'assets/images/add.png',
        title: 'Add Teacher',
        onTap: () {
          showAddTeacherDialog();
        },
      ),
      QuickAction(
        icon: 'assets/images/announcement.png',
        title: 'Add Announcement',

        onTap: () => showAddAnnouncementDialog(),
      ),
      QuickAction(
        icon: 'assets/images/classes.png',
        title: 'View Classes',
        onTap: () => debugPrint("View Classes tapped"),
      ),
    ];
  }
}
