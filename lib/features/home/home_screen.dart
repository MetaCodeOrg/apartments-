import 'package:flutter/material.dart';
import 'package:flutter_app/core/controller/connect_controller.dart';
import 'package:flutter_app/features/home/controller/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              GetBuilder<ConnectController>(
                builder: (connect) {
                  if (connect.checkIsConnect) {
                    return Container();
                  }
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    color: connect.checkIsConnect
                        ? const Color(0xFF00EE44)
                        : const Color(0xFFEE4400),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      child: connect.checkIsConnect
                          ? Text('online'.tr)
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('offline'.tr),
                                const SizedBox(width: 8.0),
                                const SizedBox(
                                  width: 12.0,
                                  height: 12.0,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.0,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  );
                },
              ),
              Expanded(
                child: IndexedStack(
                  index: controller.pageIndex.value,
                  children: controller.screens,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          useLegacyColorScheme: false,
          currentIndex: controller.pageIndex.value,
          onTap: controller.jumpToPage,
          selectedIconTheme: IconThemeData(size: 30.sp, color: Colors.blue),
          unselectedIconTheme: IconThemeData(size: 26.sp, color: Colors.grey),
          items: controller.items.map((item) {
            return BottomNavigationBarItem(
              icon: Icon(
                item.icon,
                // size: 26.sp,
              ),
              label: item.title.tr,
            );
          }).toList(),
        ),
      );
    });
  }
}
