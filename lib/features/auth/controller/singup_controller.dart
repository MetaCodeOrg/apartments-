import 'package:flutter/material.dart';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:get/get.dart';

class SingupController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNum = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;

  final formkeysignup = GlobalKey<FormState>();

  var showPassIcon = false.obs;

  void togglePasswordVisibility() {
    showPassIcon.value = !showPassIcon.value;
  }

  void register() {
    if (formkeysignup.currentState!.validate()) {
      return;
    }
    Get.offAllNamed(AppRoutes.home);
  }
}
