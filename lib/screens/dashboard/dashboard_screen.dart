import 'package:flutter/material.dart' hide DrawerController;
import 'package:get/get.dart';
import 'package:school_management_system_admin/components/drawer/drawer.dart';
import 'package:school_management_system_admin/components/drawer/drawer_controller.dart';
import 'package:school_management_system_admin/components/drawer/drawer_data.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';
import 'package:school_management_system_admin/utils/responsive.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(icon, color: color, size: 24),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Initialize drawer controller with data
    final drawerController = Get.find<CustomDrawerController>();
    if (drawerController.items.isEmpty) {
      drawerController.setUserName('Admin User');
      drawerController.setItems(CustomDrawerData().sideMenuItems);
      drawerController.setActiveIndex(0);
    }
    final isDesktop = Responsive.isDesktop(context);

    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      // drawer: !isDesktop ? const SizedBox(width: 250, child: SideMenu()) : null,
      // endDrawer: isMobile
      //     ? SizedBox(
      //         width: MediaQuery.of(context).size.width * 0.8,
      //         child: const SummaryWidget(),
      //       )
      //     : null,
      backgroundColor: AppPallete.containerColor,
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)
              const Expanded(flex: 2, child: SizedBox(child: CustomDrawer())),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Stats Cards
                    GridView.count(
                      crossAxisCount: Responsive.isDesktop(context) ? 4 : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      children: [
                        _buildStatCard(
                          'Students',
                          '1,250',
                          Icons.people,
                          Colors.blue,
                        ),
                        _buildStatCard(
                          'Teachers',
                          '75',
                          Icons.school,
                          Colors.green,
                        ),
                        _buildStatCard(
                          'Classes',
                          '32',
                          Icons.class_,
                          Colors.orange,
                        ),
                        _buildStatCard(
                          'Events',
                          '12',
                          Icons.event,
                          Colors.purple,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Recent Activity
                    const Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors
                                    .primaries[index % Colors.primaries.length],
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text('Activity ${index + 1}'),
                              subtitle: Text(
                                'This is a description of activity ${index + 1}',
                              ),
                              trailing: Text('${index + 1}h ago'),
                            ),
                          );
                        },
                      ),
                    ),
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
