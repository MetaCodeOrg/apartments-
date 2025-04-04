import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/core/constants/widgets/snak_bar.dart';
import 'package:flutter_app/core/pereferences/shared_pref.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/services/helper_function.dart';
import 'package:mc_utils/mc_utils.dart';

import '../../../services/auth/auth_api.dart';

class UserController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  final AuthApi authApi = AuthApi(Get.find());

  UserModel? userModel;

  Future<void> getDataPrefrence() async {
    userModel = SharedPrefs.getDataUser();

    await handleRequestfunc(
      statusRequest: statusRequest,
      hideLoading: true,
      status: (p0) {
        statusRequest = p0;
        update();
      },
      apiCall: () async => await authApi.getDataProfile("${userModel?.token}"),
      onSuccess: (res) {
        log(res.toString());
        if (res['data'] != null) {
          var usr = UserModel.fromMap(res['data']['user']);
          userModel = userModel?.copyWith(
            isEmailVerified: usr.isEmailVerified,
            token: usr.token,
          );
          update();

          SharedPrefs.setDataUser(userModel!);
        }
      },
      onError: (p0) {
        if (statusRequest == StatusRequest.unauthorized) {
          showSnakBar(
              title: "unauthorized".tr,
              msg: "you_are_logout".tr,
              color: Colors.red,
              time: 5);
          logout();
        }
      },
    );
  }

  void logout() {
    SharedPrefs.setBoolean(SharedPrefs.isLogin, false);
    Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onInit() {
    super.onInit();
    getDataPrefrence();
  }
}
