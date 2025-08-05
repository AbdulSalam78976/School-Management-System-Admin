import 'package:flutter/material.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(),

        // Notification Icon
        GestureDetector(
          onTap: () {
            // Handle notification tap
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppPallete.containerColor,
            child: IconButton(
              icon: const Icon(Icons.notifications_none),
              color: AppPallete.textPrimaryColor,
              iconSize: 20,
              onPressed: () {
                // Handle notification tap
              },
            ),
          ),
        ),

        const SizedBox(width: 16),

        // Profile Picture
        InkWell(
          onTap: () {
            // Handle profile picture tap
          },
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/300', // You can use local asset instead
            ),
          ),
        ),
      ],
    );
  }
}
