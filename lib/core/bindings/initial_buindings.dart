import 'package:flutter_app/features/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_app/features/auth/controller/auth_controller.dart';

import '../../services/api/post_get_page.dart';
import '../controller/connect_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut(() => PostGetPage());
    Get.put(ConnectController(), permanent: true);
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());

  }
}
