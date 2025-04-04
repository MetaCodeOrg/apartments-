import 'package:flutter/material.dart';
import 'package:flutter_app/core/class/enum_pages.dart';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/services/auth/auth_api.dart';
import 'package:flutter_app/services/helper_function.dart';
import 'package:get/get.dart';

class SingupController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNum = TextEditingController();

  StatusRequest statusRequest = StatusRequest.none;
  final AuthApi authApi = AuthApi(Get.find());

  final formkeysignup = GlobalKey<FormState>();

  var showPassIcon = false.obs;

  void togglePasswordVisibility() {
    showPassIcon.value = !showPassIcon.value;
  }

  Future<void> register() async {
    if (!formkeysignup.currentState!.validate() || phoneNum.text.isEmpty) {
      return;
    }
    await handleRequestfunc(
      statusRequest: statusRequest,
      status: (p0) {
        if (p0 == StatusRequest.unauthorized) {
          Get.offAllNamed(AppRoutes.verifyCode, arguments: {
            'pageType': EnumPages.register.text,
            "email": email.text
          });
        }
      },
      apiCall: () async {
        return await authApi.postRegister(
            username.text, phoneNum.text, email.text, password.text, "");
      },
      onSuccess: (res) {
        Get.offAllNamed(AppRoutes.verifyCode, arguments: {
          'pageType': EnumPages.register.text,
          "email": email.text
        });
      },
      onError: showError,
    );
  }
}
