import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/features/auth/controller/auth_controller.dart';
import 'package:flutter_app/core/functions/validation.dart';
import 'package:flutter_app/core/constants/widgets/custom_text_field.dart';
import 'package:flutter_app/features/auth/widgets/auth_widgets.dart';
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
              child: Center(
                child: Text(
                  'login_title'.tr,
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
                        hintText: 'enter_name'.tr,
                        labelText: 'name'.tr,
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
                        hintText: 'enter_phone'.tr,
                        labelText: 'phone'.tr,
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
                        return CustomAuthTextField(
                          controller: controller.password,
                          hintText: 'password'.tr,
                          labelText: 'password'.tr,
                          textAlign: TextAlign.right,
                          obscureText: controller.showPassIcon.value,
                          validator: (p0) =>
                              validInput(p0 ?? "", 6, 30, "password"),
                          suffixIcon: Icon(
                              controller.showPassIcon.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          onSuffixIconPressed: controller.togglePasswordVisibility,
                        );
                      }),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () => Get.toNamed('/forget'),
                          child: Text(
                            'forgot_password'.tr,
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
                                    backgroundColor:
                                        const Color.fromARGB(255, 92, 157, 175),
                                  ),
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      controller.loginFunc();
                                    }
                                  },
                                  child: Text(
                                    'enter'.tr,
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
                          onTap: () => Get.toNamed(AppRoutes.accountType),
                          child: RichText(
                            text: TextSpan(
                              text: "no_account".tr + "  ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: "create_account".tr,
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
