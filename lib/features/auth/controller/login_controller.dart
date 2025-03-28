import 'package:flutter/material.dart';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/core/pereferences/shared_pref.dart';
import 'package:flutter_app/features/auth/controller/forget_password_controller.dart';
import 'package:flutter_app/features/auth/controller/singup_controller.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:mc_utils/mc_utils.dart';

class LoginController extends GetxController {
  bool showPassword = true;
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  FocusNode focusPhone = FocusNode();
  FocusNode focusname = FocusNode();

  FocusNode focusPassword = FocusNode();
  final formKeyLogin = GlobalKey<FormState>();
  bool isSwitchOn = false;
  StatusRequest statusRequest = StatusRequest.none;
  // final AuthApi authApi = AuthApi(Get.find());
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
    SharedPrefs.setBoolean(SharedPrefs.isLogin, true);
    SharedPrefs.setDataUser(UserModel(
      email: "test@gmail.com",
      uuid: "114-85446-erref-79edwd4-uuy88",
      name: "Test",
      password: "123456789",
      phoneNum: "+967773701837",
      token: "99999999999999999",
      isVerify: true,
      photo: "https://example.com/photo.jpg",
    ));
    Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onInit() {
    super.onInit();
    Get.find<ForgetPasswordController>();
    Get.find<SingupController>();
  }
}
