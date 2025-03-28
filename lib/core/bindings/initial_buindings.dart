import 'package:flutter_app/features/auth/controller/reset_password_controller.dart';
import 'package:flutter_app/features/auth/controller/singup_controller.dart';
import 'package:flutter_app/features/auth/controller/verification_code_controller.dart';
import 'package:flutter_app/features/home/controller/home_controller.dart';
import 'package:get/get.dart';
import '../../features/auth/controller/forget_password_controller.dart';
import '../../features/auth/controller/login_controller.dart';
import '../../services/api/post_get_page.dart';
import '../controller/connect_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ConnectController(), permanent: true);
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SingupController());
    Get.lazyPut(() => ForgetPasswordController());
    Get.lazyPut(() => ResetPasswordController());
    Get.lazyPut(() => VerificationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => PostGetPage());
  }
}
