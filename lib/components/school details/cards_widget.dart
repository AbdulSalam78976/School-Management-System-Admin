import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/components/custom_card_widget.dart';
import 'package:school_management_system_admin/components/school%20details/school_details_controller.dart';

class SchoolDetailsCard extends StatelessWidget {
  const SchoolDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SchoolDetailsController());
    return GridView.builder(
      itemCount: controller.SchoolDetails.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 8,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        final item = controller.SchoolDetails[index];

        return CustomCardWidget(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(item.image, width: 50, height: 50),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4),
                child: Text(
                  item.value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
