import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/resources/routes/route_names.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RxBool isObscure = true.obs;
  final RxBool isLoading = false.obs;

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      try {
        // Simulate API call with delay
        await Future.delayed(const Duration(seconds: 2));

        // For demo purposes, navigate to dashboard
        // In a real app, you would validate credentials with an API
        SnackBar snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          duration: const Duration(seconds: 1),
          content: AwesomeSnackbarContent(
            title: 'Success',
            message: 'Login successful',
            contentType: ContentType.success,
          ),
        );
        ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
        Get.offAllNamed(RouteName.dashboardScreen);
      } catch (e) {
        SnackBar snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          duration: const Duration(seconds: 1),
          content: AwesomeSnackbarContent(
            title: 'Error',
            message: 'Login failed. Please try again.',
            contentType: ContentType.failure,
          ),
        );
        ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
      } finally {
        isLoading.value = false;
      }
    }
  }

  void forgotPassword() {}

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
