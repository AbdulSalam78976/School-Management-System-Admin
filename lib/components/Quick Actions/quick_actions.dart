import 'package:flutter/material.dart';
import 'package:school_management_system_admin/components/Quick%20Actions/quick_action_widget.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Actions",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppPalette.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 16),

        // Quick Actions Cards
        QuickActionCardWidget(),
      ],
    );
  }
}
