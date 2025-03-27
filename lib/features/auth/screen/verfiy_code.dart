import 'package:flutter/material.dart';
import 'package:flutter_app/features/auth/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/auth_widgets.dart';

class VerifyCodePage extends StatelessWidget {
  VerifyCodePage({super.key});
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
                      'verify.title'.tr,
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
                      'verify.subtitle'.tr,
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
                key: controller.formkeyverify,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      PinCodeTextField(
                        appContext: context,
                        length: 4, // عدد الخانات
                        onChanged: (value) {
                          // يمكنك إضافة أي منطق هنا عند تغيير القيمة
                        },
                        onCompleted: (verificationCode) {
                          // controller.goToSuccessSignUp(verificationCode);
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 60,
                          fieldWidth: 60,
                          inactiveColor: Colors.grey,
                          activeColor: Colors.blue,
                          selectedColor: Colors.blueAccent,
                        ),
                        keyboardType: TextInputType.number,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 100),

                      /// زر إرسال كود التحقق
                      Obx(() => AuthButton(
                            text: 'verify.send'.tr,
                            isLoading: controller.isLoading.value,
                            onPressed: () async {
                              if (controller.formkeyverify.currentState?.validate() ?? false) {
                                await controller.loginFunc();
                                Get.toNamed('/new_pass');
                              } else {
                                print("Form validation failed");
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
              height: MediaQuery.of(context).size.height * 0.2,
              color: const Color.fromARGB(255, 92, 157, 175),
            ),
          ],
        ),
      ),
    );
  }
}
