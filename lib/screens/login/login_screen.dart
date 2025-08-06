import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';
import 'package:school_management_system_admin/screens/login/login_controller.dart';
import 'package:school_management_system_admin/utils/responsive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    final isDesktop = Responsive.isDesktop(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppPalette.containerColor,
      body: Row(
        children: [
          // Left side - Illustration (visible on desktop and tablet)
          if (isDesktop || Responsive.isTablet(context))
            Expanded(
              flex: isDesktop ? 6 : 5,
              child: Container(
                color: AppPalette.containerColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.1),
                    SvgPicture.asset(
                      'assets/images/teacher.svg',
                      height: size.height * 0.5,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'School Management System',
                      style: TextStyle(
                        fontSize: isDesktop ? 28 : 24,
                        fontWeight: FontWeight.bold,
                        color: AppPalette.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Admin Portal',
                      style: TextStyle(
                        fontSize: isDesktop ? 22 : 18,
                        fontWeight: FontWeight.w500,
                        color: AppPalette.textPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Right side with login form
          Expanded(
            flex: isDesktop ? 4 : 5,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppPalette.backgroundColor,
                    AppPalette.containerColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ), // Light blue background

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    Responsive.isMobile(context) ? 0 : 40,
                  ),
                  bottomLeft: Radius.circular(
                    Responsive.isMobile(context) ? 0 : 40,
                  ),
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    padding: const EdgeInsets.all(16),
                    child: Obx(
                      () => Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Title
                          Text(
                            'Welcome to School Management System',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppPalette.textPrimaryColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Admin Portal",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppPalette.textSecondaryColor,
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Login Form
                          Form(
                            key: controller.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // School ID Field
                                Text(
                                  'Username',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppPalette.textPrimaryColor,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: controller.usernameController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your username',
                                  ),
                                  validator: controller.validateUsername,
                                ),
                                const SizedBox(height: 20),

                                // Password Field
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppPalette.textPrimaryColor,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: controller.passwordController,
                                  obscureText: controller.isObscure.value,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your password',

                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        controller.isObscure.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: AppPalette.textPrimaryColor,
                                        size: 20,
                                      ),
                                      onPressed:
                                          controller.togglePasswordVisibility,
                                    ),
                                  ),
                                  validator: controller.validatePassword,
                                ),

                                // Forgot Password
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: controller.forgotPassword,
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: AppPalette.primaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 24),

                                // Login Button
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: controller.isLoading.value
                                        ? null
                                        : controller.login,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppPalette.primaryColor,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      disabledBackgroundColor: AppPalette
                                          .primaryColor
                                          .withOpacity(0.6),
                                    ),
                                    child: controller.isLoading.value
                                        ? const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: AppPalette.primaryColor,
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : const Text(
                                            'Login',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                  ),
                                ),

                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
