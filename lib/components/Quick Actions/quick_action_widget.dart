// widgets/quick_action_card_widget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/components/Quick%20Actions/quick_action_controller.dart';
import 'package:school_management_system_admin/components/custom_card_widget.dart'
    show CustomCardWidget;

class QuickActionCardWidget extends StatelessWidget {
  final QuickActionController controller = Get.put(QuickActionController());

  QuickActionCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GridView.builder(
        itemCount: controller.quickActions.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 8,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, index) {
          final action = controller.quickActions[index];
          return InkWell(
            onTap: action.onTap,
            child: CustomCardWidget(
              padding: EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(action.icon, width: 40, height: 40),
                  const SizedBox(height: 12),
                  Text(
                    action.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
