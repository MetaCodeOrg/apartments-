import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_constants.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/core/theme/controller/theme_controller.dart';
import 'package:flutter_app/core/theme/dark_theme.dart';
import 'package:flutter_app/core/theme/light_theme.dart';
import 'package:flutter_app/features/language/controller/localization_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/class/translate.dart';
import 'core/helper/get_di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await di.init();

  runApp(MyApp(
    languages: languages,
  ));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>>? languages;
  const MyApp({super.key, this.languages});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetBuilder<ThemeController>(builder: (themeController) {
              return GetBuilder<LocalizationController>(builder: (localizeController) {
                return GetMaterialApp(
                  builder: EasyLoading.init(),
                  title: AppConstants.appName,
                  debugShowCheckedModeBanner: false,
                  navigatorKey: Get.key,
                  scrollBehavior: const MaterialScrollBehavior().copyWith(
                    dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
                  ),
                  themeMode: ThemeMode.system,
                  theme: themeController.darkTheme ? dark : light,
                  locale: localizeController.locale,
                  translations: Messages(languages: languages),
                  fallbackLocale: Locale(AppConstants.languages[0].languageCode!,
                      AppConstants.languages[0].countryCode),
                  defaultTransition: Transition.topLevel,
                  initialRoute: '/',
                  getPages: AppRoutes.getPages,
                );
              });
            }));
  }
}
