import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/core/theme/controller/theme_controller.dart';
import 'package:flutter_app/features/language/model/language.dart';
import 'package:mc_utils/mc_utils.dart';

import '../../features/language/controller/localization_controller.dart';
import '../../firebase_options.dart';
import '../constants/app_constants.dart';
import '../pereferences/shared_pref.dart';

Future<Map<String, Map<String, String>>> init() async {
  Get.lazyPut(() => ThemeController());
  Get.lazyPut(() => LocalizationController());
  await SharedPrefs.initPref();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // notificationService.init();
  // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };
  //languague
 Map<String, Map<String, String>> languages = {};
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/lang/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
    Map<String, String> json = {};
    mappedJson.forEach((key, value) {
      json[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        json;
  }
  return languages;
}

