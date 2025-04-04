import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/core/constants/widgets/snak_bar.dart';
import 'package:flutter_app/core/pereferences/shared_pref.dart';
import 'package:flutter_app/features/auth/controller/forget_password_controller.dart';
import 'package:flutter_app/features/auth/controller/singup_controller.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/services/auth/auth_api.dart';
import 'package:flutter_app/services/helper_function.dart';
import 'package:mc_utils/mc_utils.dart';
import '../../../core/class/enum_pages.dart';

class LoginController extends GetxController {
  bool showPassword = true;
  // TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  // TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  // FocusNode focusPhone = FocusNode();
  FocusNode focusname = FocusNode();

  FocusNode focusPassword = FocusNode();
  final formKeyLogin = GlobalKey<FormState>();
  bool isSwitchOn = false;
  StatusRequest statusRequest = StatusRequest.none;
  final AuthApi authApi = AuthApi(Get.find());
  void showHidePassword() {
    showPassword = !showPassword;
    update();
  }

  void updateSwitchValue(bool value) {
    isSwitchOn = value;
    update();
  }

  Future<void> login() async {
    if (!formKeyLogin.currentState!.validate()) {
      return;
    }
    await handleRequestfunc(
      statusRequest: statusRequest,
      status: (p0) {
        print("*********************************${p0.text}");
        if (p0 == StatusRequest.unauthorized) {
          Get.offAllNamed(AppRoutes.verifyCode, arguments: {
            'pageType': EnumPages.login.text,
            "email": email.text
          });
        }
      },
      apiCall: () async {
        return await authApi.postlogin(email.text, password.text);
      },
      onSuccess: (res) {
        log("******************${res}");
        var model = UserModel.fromMap(res['data']['user']);
        model = model.copyWith(password: password.text);

        if (!model.isEmailVerified) {
          showSnakBar(
              title: "error".tr,
              msg: res['message']['message'],
              color: Colors.red);
          return;
        }
        if (model.isEmailVerified) {
          SharedPrefs.setBoolean(SharedPrefs.isLogin, true);
          SharedPrefs.setDataUser(model);
          // if (Get.isRegistered<UserController>()) {
          //   Get.find<UserController>().getDataPrefrence();
          // }
          Get.offAllNamed(AppRoutes.home);
        } else {
          Get.offAllNamed(AppRoutes.verifyCode, arguments: {
            'pageType': EnumPages.login.text,
            "email": email.text
          });
        }
        // log("Success Login");
      },
      onError: showError,
    );
  }

  @override
  void onInit() {
    super.onInit();
    Get.find<ForgetPasswordController>();
    Get.find<SingupController>();
  }
}
