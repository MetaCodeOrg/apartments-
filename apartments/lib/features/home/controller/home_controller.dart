import 'package:flutter/material.dart';
import 'package:flutter_app/core/class/navigtor_model.dart';
import 'package:flutter_app/features/about/about.dart';
import 'package:flutter_app/features/details/controller/detalis_controller.dart';
import 'package:flutter_app/features/home/controller/apartment_controller.dart';
import 'package:flutter_app/features/home/screen/home_page.dart';
import 'package:flutter_app/features/search/search.dart';
import 'package:flutter_app/features/setting/setting.dart';
import 'package:flutter_app/features/user/controller/user_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var pageIndex = 0.obs;

  List<NavigatorModel> items = [
    NavigatorModel(
      title: 'home'.tr,
      icon: Icons.home,
    ),
    NavigatorModel(
      title: 'search'.tr,
      icon: Icons.search,
    ),
    NavigatorModel(
      title: 'about'.tr,
      icon: Icons.info_outline,
    ),
    NavigatorModel(
      title: 'settings'.tr,
      icon: Icons.settings_outlined,
    ),
  ];
  List<Widget> screens = [
    const HomePage(),
    SearchPage(),
    const AboutPage(),
    const SettingsPage(),
  ];

  void onPageChanged(int index) {
    pageIndex.value = index;
  }

  void jumpToPage(int index) {
    pageIndex.value = index;
    // update();
  }

  @override
  void onInit() {
    super.onInit();
    Get.find<ApartmentController>();
    Get.find<UserController>();
    Get.find<DetalisController>();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
