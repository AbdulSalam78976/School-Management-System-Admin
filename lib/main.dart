import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/resources/binding/app_binding.dart';
import 'package:school_management_system_admin/resources/routes/route_names.dart';
import 'package:school_management_system_admin/resources/routes/routes.dart';

import 'package:school_management_system_admin/resources/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School Management System',
      theme: AppTheme,
      initialBinding: AppBinding(),
      initialRoute: RouteName.loginScreen,
      getPages: AppRoutes.appRoutes(),
    );
  }
}
