import 'package:flutter/material.dart';
import 'package:flutter_app/core/class/enum_pages.dart';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/services/auth/auth_api.dart';
import 'package:flutter_app/services/helper_function.dart';
import 'package:mc_utils/mc_utils.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController email = TextEditingController();
  FocusNode focusEmail = FocusNode();
  StatusRequest statusRequest = StatusRequest.none;
  final AuthApi authApi = AuthApi(Get.find());

  final formKey = GlobalKey<FormState>();

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    handleRequestfunc(
      statusRequest: statusRequest,
      apiCall: () async {
        return await authApi.forgetPassword(
          email.text,
        );
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
