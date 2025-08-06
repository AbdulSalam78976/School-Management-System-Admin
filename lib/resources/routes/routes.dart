import 'package:get/get.dart';
import 'package:school_management_system_admin/resources/routes/route_names.dart';
import 'package:school_management_system_admin/screens/announcements/announcements_screen.dart';
import 'package:school_management_system_admin/screens/dashboard/dashboard_screen.dart';
import 'package:school_management_system_admin/screens/student/add_student.dart';
import 'package:school_management_system_admin/screens/student/student_management_screen.dart';
import '../../screens/login/login_screen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RouteName.loginScreen,
      page: () => LoginScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.dashboardScreen,
      page: () => const Dashboard(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.announcementsScreen,
      page: () => AnnouncementsScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RouteName.studentManagementScreen,
      page: () => StudentManagementScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
