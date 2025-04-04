import 'dart:async';
import 'dart:developer';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mc_utils/mc_utils.dart';
import 'package:get/get.dart';

class ConnectController extends GetxController {
  final connectionChecker = InternetConnectionChecker.instance;
  StreamSubscription<InternetConnectionStatus>? subscription;
  bool checkIsConnect = true;

  Future<void> checkInternet() async {
    subscription = connectionChecker.onStatusChange.listen(
      (InternetConnectionStatus status) async {
        if (status == InternetConnectionStatus.connected) {
          checkIsConnect = true;
          update();
          log('Connected to the internet');
        } else {
          checkIsConnect = false;
          update();
          log('Disconnected from the internet');
        }
      },
    );
  }

  @override
  void onInit() {
    checkInternet();
    super.onInit();
  }

  @override
  void onClose() {
    subscription?.cancel();
    super.onClose();
  }
}
