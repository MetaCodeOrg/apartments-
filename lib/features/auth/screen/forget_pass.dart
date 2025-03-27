import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/features/auth/controller/auth_controller.dart';
import 'package:flutter_app/core/constants/widgets/custom_text_field.dart';
import 'package:flutter_app/features/auth/widgets/auth_widgets.dart';
import 'package:get/get.dart';

class ForgetPass extends StatelessWidget {
  ForgetPass({super.key});
  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const AuthLogo(),

            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'forget_password.title'.tr,
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
                      'forget_password.subtitle'.tr,
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
                key: controller.formkeyforget,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      CustomTextField(
                        controller: controller.phoneNum,
                        hintText: 'enter_phone'.tr,
                        labelText: 'phone'.tr,
                        suffixIcon: const Icon(Icons.phone),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'empty'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 100),

                      /// زر إرسال كود التحقق
                      Obx(() => AuthButton(
                            text: 'forget_password.send_code'.tr,
                            isLoading: controller.isLoading.value,
                            onPressed: () async {
                              if (controller.formkeyforget.currentState!.validate()) {
                                await controller.loginFunc();
                                Get.toNamed(AppRoutes.verifyCode);
                              } else {
                                Get.toNamed(AppRoutes.verifyCode);
                              }
                            },
                          ))
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
              height: MediaQuery.of(context).size.height * 0.18,
              color: const Color.fromARGB(255, 92, 157, 175),
            ),
          ],
        ),
      ),
    );
  }
}
