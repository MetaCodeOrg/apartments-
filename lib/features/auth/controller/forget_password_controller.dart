import 'package:flutter/material.dart';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:mc_utils/mc_utils.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController phone = TextEditingController();
  FocusNode focusPhone = FocusNode();
  StatusRequest statusRequest = StatusRequest.none;
  // final AuthApi authApi = AuthApi(Get.find());

  final formKey = GlobalKey<FormState>();

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    Get.offAndToNamed(AppRoutes.verifyCode,
        arguments: {'phone': phone.text, 'pageType': 'forget'});
  }
}
