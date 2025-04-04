import 'package:flutter/material.dart';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/core/constants/widgets/snak_bar.dart';
import 'package:flutter_app/core/pereferences/shared_pref.dart';
import 'package:flutter_app/services/auth/auth_api.dart';
import 'package:flutter_app/services/helper_function.dart';
import 'package:mc_utils/mc_utils.dart';

class ResetPasswordController extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();

  FocusNode focusPass = FocusNode();
  FocusNode configPass = FocusNode();
  FocusNode curPass = FocusNode();
  bool showPassword = true;
  final formKeyRestPassword = GlobalKey<FormState>();

  String? notMatch;
  late String email;
  late bool isChangeFromAccount;
  String? token;

  StatusRequest statusRequest = StatusRequest.none;
  final AuthApi authApi = AuthApi(Get.find());

  void showHidePassword() {
    showPassword = !showPassword;
    update();
  }

//====================== Reset Password =======================//
  void resetPassword() async {
    var userData = SharedPrefs.getDataUser();
    notMatch = null;
    update();

    if (formKeyRestPassword.currentState!.validate()) {
      if (password.text != repassword.text) {
        notMatch = "not_match".tr;
        update();
        return;
      }
      await handleRequestfunc(
        statusRequest: statusRequest,
        apiCall: () async =>
            await authApi.restPassword(password.text, email, token ?? ""),
        onSuccess: (res) {
          if (isChangeFromAccount) {
            userData = userData?.copyWith(password: password.text);
            SharedPrefs.setDataUser(userData!);
            Get.back();
          } else {
            Get.offAllNamed(AppRoutes.home);
          }
          showSnakBar(
              title: 'success'.tr,
              msg: res['message'].toString(),
              color: Colors.blue);
        },
        onError: showError,
      );
    }
    // Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    token = Get.arguments['token'];
    isChangeFromAccount = (Get.arguments['change'] == 1 ? true : false);
    super.onInit();
  }
}
