import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/controller/auth_controller.dart';
import 'package:flutter_app/utils/functions/validation.dart';
import 'package:flutter_app/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});
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
              height: 0.3.sh, // ارتفاع 30% من الشاشة
              color: const Color.fromARGB(255, 92, 157, 175),
              padding: EdgeInsets.all(20.w), // الهوامش تتناسب مع العرض
              child: const Center(
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // SizedBox(height: 0.03.sh), // 3% من ارتفاع الشاشة
            Container(
              height: MediaQuery.of(context).size.height * 0.03,
              color: const Color(0xFF9ccddb),
            ),
            Container(
              padding: EdgeInsets.all(20.w),
              child: Form(
                key: formkey,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        controller: controller.username,
                        hintText: 'قم بإدخال الاسم',
                        labelText: 'الاسم',
                        suffixIcon: const Icon(Icons.edit_document),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال الاسم';
                          }
                          return null;
                        },
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        controller: controller.phoneNum,
                        hintText: 'قم بإدخال رقم الجوال',
                        labelText: 'رقم الجوال',
                        suffixIcon: const Icon(Icons.phone),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال رقم الجوال';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h),
                      Obx(() {
                        return CustomTextField(
                          controller: controller.password,
                          hintText: 'كلمة المرور',
                          labelText: 'كلمة المرور',
                          textAlign: TextAlign.right,
                          obscureText: controller.showPassIcon.value,
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
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () => Get.toNamed('/forget'),
                          child: const Text(
                            'هل نسيت كلمة المرور؟',
                            style: TextStyle(
                              color: Color(0xFFFF8D4D),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Obx(() {
                        return controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : SizedBox(
                                width: double.infinity,
                                height: 50.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(255, 92, 157, 175),
                                  ),
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      controller.loginFunc();
                                    }
                                  },
                                  child: const Text(
                                    'دخول',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                      }),
                      SizedBox(height: 25.h),
                      Center(
                        child: InkWell(
                          onTap: () => Get.offNamed('/account_type'),
                          child: RichText(
                            text: const TextSpan(
                              text: "ليس لديك حساب؟  ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: "إنشاء حساب",
                                  style: TextStyle(
                                    color: Color(0xFFFF8D4D),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
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
