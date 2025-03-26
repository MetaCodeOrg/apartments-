import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/controller/auth_controller.dart';
import 'package:flutter_app/screens/auth/pages/login.dart';
import 'package:flutter_app/utils/functions/validation.dart';
import 'package:flutter_app/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final AuthController controller = Get.find<AuthController>();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: const Color.fromARGB(255, 92, 157, 175),
              padding: const EdgeInsets.all(20),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' إنشاء حساب',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.03,
              color: const Color(0xFF9ccddb),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formkey,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GetBuilder<AuthController>(builder: (controller) {
                            return CustomTextField(
                              controller: controller.username,
                              hintText: 'قم بإدخال الاسم',
                              labelText: 'الاسم',
                              suffixIcon: const Icon(Icons.edit_document),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              textAlign: TextAlign.right, // محاذاة النص إلى اليمين
                            );
                          }),
                          const SizedBox(height: 15),
                          CustomTextField(
                            controller: controller.email,
                            hintText: 'قم بإدخال كلمة المرور',
                            labelText: 'الإيميل',
                            suffixIcon: const Icon(Icons.email),
                            keyboardType: TextInputType.emailAddress,
                            validator: (p0) => validInput(p0 ?? "", 3, 30, "email"),
                          ),
                          const SizedBox(height: 15),
                          Obx(() {
                            return CustomTextField(
                              controller: controller.password,
                              hintText: 'كلمة المرور',
                              labelText: 'كلمة المرور',
                              textAlign: TextAlign.right,
                              obscureText: !controller.showPassIcon.value,
                              validator: (p0) => validInput(p0 ?? "", 6, 30, "password"),
                              suffixIcon: IconButton(
                                onPressed: controller.togglePasswordVisibility,
                                icon: Icon(
                                  controller.showPassIcon.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                ),
                              ),
                            );
                          }),
                          const SizedBox(height: 15),
                          CustomTextField(
                            controller: controller.phoneNum,
                            hintText: 'قم بإدخال رقم الجوال ',
                            labelText: 'رقم الجوال',
                            suffixIcon: const Icon(Icons.phone),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Obx(() {
                        return controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : SizedBox(
                                width: 250,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(255, 92, 157, 175),
                                  ),
                                  onPressed: () async {
                                    if (formkey.currentState!.validate()) {
                                      controller.signUpFunc();
                                    }
                                  },
                                  child: const Text(
                                    'إنشاء حساب',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                      }),
                      const SizedBox(height: 25),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "املك حساب سابق ؟ ",
                            style: const TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                            children: [
                              TextSpan(
                                  text: "تسجيل دخول",
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(() => Login());
                                    }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
