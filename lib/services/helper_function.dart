import 'dart:developer';

import 'package:flutter_app/core/class/handlingdataview.dart';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/core/controller/connect_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/widgets/snak_bar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mc_utils/mc_utils.dart';

//====================== Helper Functions ======================//
void showError(String msg, {bool hideLoading = false}) {
  if (!hideLoading) {
    // log(Get.find<ConnectController>().checkIsConnect.toString());
    if (Get.find<ConnectController>().checkIsConnect) {
      showSnakBar(title: 'error'.tr, msg: msg, color: Colors.red);
    }
  }
}

Future<void> handleRequestfunc<T>({
  required Future<T> Function() apiCall,
  required Function(T data) onSuccess,
  required Function(String) onError,
  Function(StatusRequest)? status,
  required StatusRequest statusRequest,
  bool hideLoading = false,
}) async {
  statusRequest = StatusRequest.loading;
  if (status != null) {
    status(statusRequest);
  }
  try {
    if (!hideLoading) {
      EasyLoading.show(
        status: 'loading...',
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.clear,
      );
    }
    var res = await apiCall();
    if (res is FailureWithMessage) {
      if (status != null) {
        status(res.status);
      }
      onError(res.message['message']);
      return;
    }
    statusRequest = handlingData(res);
    if (statusRequest == StatusRequest.success) {
      onSuccess(res);
      if (status != null) {
        status(statusRequest);
      }
    }
  } catch (e) {
    onError("Error ClientException $e");
    log("================$e===========");
    if (status != null) {
      status(StatusRequest.failure);
    }
  } finally {
    if (!hideLoading) {
      EasyLoading.dismiss();
    }
  }
}
