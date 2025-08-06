import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';

void showAddStudentDialog() {
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final dateController = TextEditingController();

  String? gender;
  String? selectedClass;
  File? profileImage;

  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      Get.back(); // Close and reopen to update UI
      showAddStudentDialog(); // Reopen with updated image
    }
  }

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
              "Add New Student",
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
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: idController,
                    decoration: const InputDecoration(
                      labelText: "ID Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      labelText: "Date of Birth",
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true,
                    onTap: () async {
                      final pickedDate = await showDatePicker(
                        context: Get.context!,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        dateController.text =
                            "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: DropdownButtonFormField<String>(
                    dropdownColor: AppPalette.textDisabledColor,
                    decoration: const InputDecoration(
                      labelText: "Gender",
                      border: OutlineInputBorder(),
                    ),
                    items: ['Male', 'Female']
                        .map(
                          (g) => DropdownMenuItem(
                            value: g,
                            child: Text(
                              g,
                              style: TextStyle(
                                color: AppPalette.textPrimaryColor,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (val) => gender = val,
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: "Phone",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      labelText: "Address",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: DropdownButtonFormField<String>(
                    dropdownColor: AppPalette.textDisabledColor,
                    decoration: const InputDecoration(
                      labelText: "Class Assignment",
                      border: OutlineInputBorder(),
                    ),
                    items: List.generate(
                      13,
                      (index) => DropdownMenuItem(
                        value: "Class ${index + 1}",
                        child: Text(
                          "Class ${index + 1}",
                          style: TextStyle(color: AppPalette.textPrimaryColor),
                        ),
                      ),
                    ),
                    onChanged: (val) => selectedClass = val,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Upload Profile Picture
            InkWell(
              onTap: pickImage,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade100,
                ),
                alignment: Alignment.center,
                child: profileImage != null
                    ? Image.file(
                        profileImage!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.upload_file_outlined,
                            size: 40,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Upload Profile Picture\nDrag and drop or click to upload",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
              ),
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
                    print("Name: ${nameController.text}");
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
