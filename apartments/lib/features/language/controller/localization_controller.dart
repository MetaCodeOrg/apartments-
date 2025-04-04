import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_constants.dart';
import 'package:flutter_app/core/pereferences/shared_pref.dart';
import 'package:flutter_app/features/language/model/language.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController implements GetxService {
  // final LanguageServiceInterface languageServiceInterface;
  LocalizationController() {
    loadCurrentLanguage();
  }

  Locale _locale = Locale(AppConstants.languages[0].languageCode!,
      AppConstants.languages[0].countryCode);
  Locale get locale => _locale;

  bool _isLtr = true;
  bool get isLtr => _isLtr;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  List<LanguageModel> _languages = [];
  List<LanguageModel> get languages => _languages;

  void setLanguage(Locale locale, {bool fromBottomSheet = false}) {
    Get.updateLocale(locale);
    _locale = locale;
    if (!fromBottomSheet) {
      saveCacheLanguage(_locale);
    }
    update();
  }

  void loadCurrentLanguage() async {
    if (SharedPrefs.getString(SharedPrefs.localLange).isNotEmpty) {
      var index = AppConstants.languages.indexWhere(
        (element) =>
            element.countryCode ==
            (SharedPrefs.getString(SharedPrefs.localLange)),
      );
      _locale = Locale(
        AppConstants.languages[index].languageCode!,
        AppConstants.languages[index].countryCode,
      );
      _selectedIndex = index;
    }
    _isLtr = _locale.languageCode != 'ar';

    _languages = [];
    _languages.addAll(AppConstants.languages);
    update();
  }

  void saveCacheLanguage(Locale locale) async {
    SharedPrefs.setString(SharedPrefs.localLange, locale.countryCode ?? 'en');
    _locale = locale;
    Get.updateLocale(locale);
  }

  void setSelectIndex(int index) async {
    _selectedIndex = index;
    _locale =
        Locale(languages[index].languageCode!, languages[index].countryCode);
    Get.updateLocale(_locale);
  }
}
