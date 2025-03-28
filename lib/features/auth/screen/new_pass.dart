import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/core/constants/assets/images.dart';
import 'package:flutter_app/core/constants/widgets/custom_text_field.dart';
import 'package:flutter_app/features/auth/controller/reset_password_controller.dart';
import 'package:flutter_app/features/auth/widgets/auth_widgets.dart';
import 'package:get/get.dart';

class NewPass extends GetView<ResetPasswordController> {
  NewPass({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Get.offAllNamed('/');
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(AppImages.logo),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.black, size: 25),
                        onPressed: () {
                          Get.offAllNamed(AppRoutes.home);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'new_password.title'.tr,
                        style: TextStyle(
                          color: Color.fromARGB(255, 92, 157, 175),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'new_password.subtitle'.tr,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// حقل إدخال رقم الجوال
              Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: controller.formKeyRestPassword,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      CustomTextField(
                        controller: controller.password,
                        hintText: 'new_password.new_password'.tr,
                        labelText: 'password'.tr,
                        suffixIcon: Icon(
                          controller.showPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.showPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'empty'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        controller: controller.repassword,
                        hintText: 'new_password.confirm_password'.tr,
                        labelText: 'new_password.confirm_password'.tr,
                        suffixIcon: Icon(
                          controller.showPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.showPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'empty'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 50),
                      AuthButton(
                        text: 'save'.tr,
                        isLoading: false,
                        onPressed: controller.resetPassword,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

              Container(
                height: MediaQuery.of(context).size.height * 0.03,
                color: const Color(0xFF9ccddb),
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.16,
                color: const Color.fromARGB(255, 92, 157, 175),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
