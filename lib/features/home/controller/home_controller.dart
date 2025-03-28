import 'package:flutter/material.dart';
import 'package:flutter_app/core/class/navigtor_model.dart';
import 'package:flutter_app/features/about/about.dart';
import 'package:flutter_app/features/home/screen/home_page.dart';
import 'package:flutter_app/features/search/search.dart';
import 'package:flutter_app/features/setting/setting.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var pageIndex = 0.obs;

  List<NavigatorModel> items = [
    NavigatorModel(
      title: 'home',
      icon: Icons.home,
    ),
    NavigatorModel(
      title: 'search',
      icon: Icons.search,
    ),
    NavigatorModel(
      title: 'about',
      icon: Icons.info_outline,
    ),
    NavigatorModel(
      title: 'setting',
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
    // Get.find<MappingController>();
    // Get.find<UserController>();
    // Get.find<CartController>();
    // Get.find<CategoriesController>();
    // Get.find<OrderController>();
    // Get.find<ProductsController>();

    // Future.delayed(
    //   const Duration(seconds: 3),
    //   () {
    //     Get.find<ConnectController>().gotoPageExplore();
    //   },
    // );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
