import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';

void showAddAnnouncementDialog() {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String? selectedAudience = 'All'; // Default selection

  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: AppPalette.containerColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Create New Announcement",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppPalette.textPrimaryColor,
              ),
            ),
            const SizedBox(height: 24),

            // Title Field
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
              maxLength: 100,
            ),
            const SizedBox(height: 16),

            // Description Field
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 5,
              maxLength: 500,
            ),
            const SizedBox(height: 16),

            // Audience Selection
            DropdownButtonFormField<String>(
              dropdownColor: AppPalette.textDisabledColor,
              value: selectedAudience,
              decoration: const InputDecoration(
                labelText: "Send To",
                border: OutlineInputBorder(),
              ),
              items:
                  [
                    'All',
                    'Students Only',
                    'Teachers Only', // Would need additional logic for class selection
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: AppPalette.textPrimaryColor),
                      ),
                    );
                  }).toList(),
              onChanged: (value) {
                selectedAudience = value;
              },
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  style: TextButton.styleFrom(
                    foregroundColor: AppPalette.errorColor,
                  ),
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Please enter a title",
                        colorText: Colors.white,
                        backgroundColor: Colors.red,
                      );
                      return;
                    }

                    // Here you would typically save the announcement
                    print("Announcement Created:");
                    print("Title: ${titleController.text}");
                    print("Description: ${descriptionController.text}");
                    print("Audience: $selectedAudience");

                    Get.back();
                    Get.snackbar(
                      "Success",
                      "Announcement created successfully",
                      colorText: Colors.white,
                      backgroundColor: Colors.green,
                    );
                  },
                  child: const Text("Publish"),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
