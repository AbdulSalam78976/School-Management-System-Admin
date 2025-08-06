import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system_admin/components/custom_card_widget.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final day = DateFormat('EEEE').format(now); // e.g., Monday
    final date = DateFormat(
      'dd MMMM, yyyy',
    ).format(now); // e.g., 05 August, 2025

    return CustomCardWidget(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Left side: Welcome text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppPalette.textPrimaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Welcome to the School Admin Dashboard",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppPalette.textSecondaryColor,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Right side: Day and Date
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  day,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppPalette.primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppPalette.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
