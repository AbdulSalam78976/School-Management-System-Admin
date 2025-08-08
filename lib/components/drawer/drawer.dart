import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system_admin/components/drawer/drawer_controller.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CustomDrawerController>();

    return Obx(
      () => SafeArea(
        child: Column(
          children: [
            // Logo and title section
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    backgroundImage: const AssetImage('assets/images/logo.png'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Public School',
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppPalette.primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            // Drawer Items
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  final isActive = item.isActive;

                  return InkWell(
                    onTap: () {
                      controller.setActiveIndex(index);
                      item.onTap();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppPalette.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Image.asset(item.icon, width: 30, height: 30),

                          const SizedBox(width: 12),
                          Text(
                            item.title,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: isActive ? Colors.white : Colors.grey,
                              fontSize: isActive ? 18 : 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: InkWell(
                onTap: controller.logout,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppPalette.errorColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
