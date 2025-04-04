import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/class/enum_pages.dart';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/core/constants/widgets/snak_bar.dart';
import 'package:flutter_app/core/functions/alerteapp.dart';
import 'package:flutter_app/services/auth/auth_api.dart';
import 'package:flutter_app/services/helper_function.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late String email;
  late EnumPages pageType;

  String msgOtp = "";
  RxBool isCanSend = false.obs;
  RxInt remainingTime = 285.obs;
  Timer? timer;

  TextEditingController otpControllers = TextEditingController();

  StatusRequest statusRequest = StatusRequest.none;
  final AuthApi authApi = AuthApi(Get.find());

  void startTimer() {
    timer?.cancel();
    remainingTime.value = 285;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        timer.cancel();
        isCanSend.value = true;
      }
    });
  }

  void resendCode() async {
    if (remainingTime.value > 0) return;

    await alertDialogData(
      title: "alert".tr,
      body: "resend_alert".tr,
      accespt: () {
        sendCode(isSendCode: true);
        Get.back();
      },
      denided: () => Get.back(),
    );
  }

  void sendCode({bool isSendCode = false}) async {
    await handleRequestfunc(
      statusRequest: statusRequest,
      apiCall: () async => await authApi.sandVerifiyCode(email),
      onSuccess: (res) {
        isCanSend.value = false;
        startTimer();
        showSnakBar(
            title: 'success'.tr,
            msg: res['message'].toString(),
            color: Colors.blue);
        clearOtpFields();
      },
      onError: showError,
    );
  }

  void checkVerifyCode() async {
    statusRequest = StatusRequest.loading;
    if (!formKey.currentState!.validate()) return;

    String codeOtp = otpControllers.text;
    await handleRequestfunc(
      statusRequest: statusRequest,
      apiCall: () async => await authApi.verificationCodeEmail(email, codeOtp),
      onSuccess: (res) {
        // if (res['token'] != null) {
        showSnakBar(
            title: 'success'.tr,
            msg: res['message'].toString(),
            color: Colors.blue);
        if (pageType == EnumPages.forgetPassword) {
          Get.offAllNamed(AppRoutes.newPassword, arguments: {
            'email': email,
            'token': res['token'],
          });
          return;
        }
        Get.offAllNamed(AppRoutes.home);
        // }
      },
      onError: showError,
    );

    clearOtpFields();
  }

  void clearOtpFields() {
    otpControllers.clear();
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'] ?? "";
    pageType =
        PagestFromTextExtension.fromText(Get.arguments['pageType'] ?? "");
    msgOtp =
        "${'enter_the_verification_sent_to'.tr} ${obfuscateEmail(email)} . ${'otp_time'.tr} ";
    // startTimer();
    // if (Get.arguments['expired'] != null) {
    //   remainingTime.value =
    //       (int.tryParse(Get.arguments['expired'].toString()) ?? 285) * 60;
    //   startTimer();
    // } else {
    sendCode();
    // }
  }

  String obfuscateEmail(String email) {
    List<String> parts = email.split('@');
    if (parts.length != 2) return email;

    String localPart = parts[0];
    String domainPart = parts[1];
    if (localPart.length <= 3) return email;

    String obscuredLocalPart =
        '${localPart.substring(0, 2)}***${localPart.substring(localPart.length - 2)}';
    return '$obscuredLocalPart@$domainPart';
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void showError(dynamic error) {
    showSnakBar(title: 'error'.tr, msg: error.toString(), color: Colors.red);
  }
}
