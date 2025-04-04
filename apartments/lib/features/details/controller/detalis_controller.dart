import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/core/constants/widgets/snak_bar.dart';
import 'package:flutter_app/services/data/data_api.dart';
import 'package:flutter_app/services/helper_function.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DetalisController extends GetxController {
  Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final DataApi authApi = DataApi(Get.find());

  Future<void> sendOrder(int id) async {
    await handleRequestfunc(
        statusRequest: statusRequest.value,
        // hideLoading: true,
        status: (p0) {
          statusRequest.value = p0;
          // update();
        },
        apiCall: () async => await authApi.makeOrder(id, "Ok Im witing"),
        onSuccess: (res) {
          log(res.toString());
          showSnakBar(
            title: "Success",
            msg: res['message'],
            color: Colors.green,
          );
        },
        onError: showError);
  }
}
