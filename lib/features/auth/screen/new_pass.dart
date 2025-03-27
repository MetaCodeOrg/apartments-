import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/features/auth/controller/auth_controller.dart';
import 'package:flutter_app/core/constants/widgets/custom_text_field.dart';
import 'package:flutter_app/features/auth/widgets/auth_widgets.dart';
import 'package:get/get.dart';

class NewPass extends StatelessWidget {
  NewPass({super.key});
  final AuthController controller = Get.find<AuthController>();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Stack(
                children: [
                  Center(
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.black, size: 25),
                      onPressed: () {
                        Get.back();
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
                    alignment: Alignment.centerRight,
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
                    alignment: Alignment.centerRight,
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
                key: formkey,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      CustomTextField(
                        controller: controller.phoneNum,
                        hintText: 'new_password.new_password'.tr,
                        labelText: 'password'.tr,
                        suffixIcon: const Icon(Icons.phone),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'empty'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        controller: controller.phoneNum,
                        hintText: 'new_password.confirm_password'.tr,
                        labelText: 'new_password.confirm_password'.tr,
                        suffixIcon: const Icon(Icons.phone),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'empty'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 50),

                      /// زر إرسال كود التحقق
                      Obx(() => AuthButton(
                            text: 'new_pass.save'.tr,
                            isLoading: controller.isLoading.value,
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                await controller.loginFunc();
                                Get.toNamed(AppRoutes.login);
                              }
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            Container(
              height: MediaQuery.of(context).size.height * 0.03,
              color: const Color(0xFF9ccddb),
            ),

            /// المساحة السفلية الزرقاء
            Container(
              height: MediaQuery.of(context).size.height * 0.16,
              color: const Color.fromARGB(255, 92, 157, 175),
            ),
          ],
        ),
      ),
    );
  }
}
