import 'package:flutter/material.dart' hide DrawerController;
import 'package:get/get.dart';
import 'package:school_management_system_admin/components/Quick%20Actions/quick_actions.dart';
import 'package:school_management_system_admin/components/drawer/drawer.dart';
import 'package:school_management_system_admin/components/drawer/drawer_controller.dart';
import 'package:school_management_system_admin/components/drawer/drawer_data.dart';
import 'package:school_management_system_admin/components/greeting/greeting_widget.dart';
import 'package:school_management_system_admin/components/header/header.dart';
import 'package:school_management_system_admin/components/school%20details/cards_widget.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';
import 'package:school_management_system_admin/utils/responsive.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize drawer controller with data
    final drawerController = Get.find<CustomDrawerController>();
    if (drawerController.items.isEmpty) {
      drawerController.setItems(CustomDrawerData().sideMenuItems);
      drawerController.setActiveIndex(0);
    }
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      // drawer: !isDesktop ? const SizedBox(width: 250, child: SideMenu()) : null,
      // endDrawer: isMobile
      //     ? SizedBox(
      //         width: MediaQuery.of(context).size.width * 0.8,
      //         child: const SummaryWidget(),
      //       )
      //     : null,
      backgroundColor: AppPallete.backgroundColor,
      body: SafeArea(
        child: Row(
          children: [
            // Side Menu
            if (isDesktop)
              const Expanded(flex: 2, child: SizedBox(child: CustomDrawer())),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    const HeaderWidget(),
                    const SizedBox(height: 18),
                    const WelcomeCard(),
                    const SizedBox(height: 18),
                    SchoolDetailsCard(),
                    const SizedBox(height: 18),
                    QuickActions(),
                  ],
                ),
              ),
            ),
            //if (isDesktop) const Expanded(flex: 3, child: SummaryWidget()),
          ],
        ),
      ),
    );
  }
}
