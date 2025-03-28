import 'package:flutter/material.dart';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/features/auth/controller/verification_code_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mc_utils/mc_utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/auth_widgets.dart';

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VerificationController>();
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Get.offAllNamed('/');
      },
      child: Scaffold(
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
                      alignment: Alignment.center,
                      child: Text(
                        'verify.title'.tr,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 92, 157, 175),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Align(
                        alignment: Alignment.centerRight,
                        child: McText(
                          txt: controller.msgOtp,
                          fontSize: 12.sp,
                          txtAlign: TextAlign.center,
                          line: 3,
                          blod: true,
                          color: Colors.grey,
                        )),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      PinCodeTextField(
                        controller: controller.otpControllers[0],
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
                      const SizedBox(height: 50),
                      Obx(() {
                        final minutes = controller.remainingTime ~/ 60;
                        final seconds = controller.remainingTime % 60;
                        final timerText = (minutes == 0 && seconds == 0)
                            ? "did_not_receive_the_code".tr
                            : "${'resend_code'.tr}: $minutes:${seconds.toString().padLeft(2, '0')}";

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            McText(
                              txt: timerText,
                              fontSize: 12.sp,
                              line: 2,
                              txtAlign: TextAlign.center,
                              blod: true,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            if (controller.isCanSend.value)
                              InkWell(
                                onTap: controller.resendCode,
                                child: McText(
                                  txt: 'resent'.tr,
                                  fontSize: 12.sp,
                                  color: Colors.orange,
                                  line: 2,
                                  txtAlign: TextAlign.center,
                                  blod: true,
                                ),
                              ),
                          ],
                        );
                      }),
                      const SizedBox(height: 50),
                      GetBuilder<VerificationController>(
                          builder: (controller) => AuthButton(
                              text: 'verify.send'.tr,
                              isLoading: controller.statusRequest ==
                                  StatusRequest.loading,
                              onPressed: controller.checkVerifyCode)),
                    ],
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
      ),
    );
  }
}
