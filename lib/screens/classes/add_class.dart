import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';

void showAddClassDialog() {
  final classNameController = TextEditingController();
  final capacityController = TextEditingController();
  final subjectsController = TextEditingController();
  final sectionController = TextEditingController();

  String? selectedTeacher;

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
              "Add New Class",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Fields (Responsive using Wrap)
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: classNameController,
                    decoration: const InputDecoration(
                      labelText: "Class Name",
                      hintText: "e.g., Class 10",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: sectionController,
                    decoration: const InputDecoration(
                      labelText: "Section (Optional)",
                      hintText: "e.g., A, B, C",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: DropdownButtonFormField<String>(
                    dropdownColor: AppPalette.textDisabledColor,
                    decoration: const InputDecoration(
                      labelText: "Assign Teacher",
                      hintText: "Select Teacher",
                      border: OutlineInputBorder(),
                    ),
                    items:
                        [
                              'Dr. Evelyn Reed',
                              'Mr. Robert Smith',
                              'Ms. Emily Chen',
                              'Dr. David Lee',
                              'Ms. Sarah Johnson',
                            ]
                            .map(
                              (teacher) => DropdownMenuItem(
                                value: teacher,
                                child: Text(
                                  teacher,
                                  style: TextStyle(
                                    color: AppPalette.textPrimaryColor,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                    onChanged: (val) => selectedTeacher = val,
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: capacityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Maximum Student Capacity",
                      hintText: "e.g., 30",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: subjectsController,
                    decoration: const InputDecoration(
                      labelText: "Associated Subjects",
                      hintText: "e.g., Math, Science",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: AppPalette.errorColor),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save logic here
                    final newClass = {
                      'className': classNameController.text,
                      'section': sectionController.text.isNotEmpty
                          ? sectionController.text
                          : null,
                      'teacher': selectedTeacher,
                      'capacity': capacityController.text,
                      'subjects': subjectsController.text
                          .split(',')
                          .map((s) => s.trim())
                          .toList(),
                    };
                    print("New Class: $newClass");
                    Get.back();
                  },
                  child: const Text("Save"),
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
