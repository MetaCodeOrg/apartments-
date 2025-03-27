import 'package:flutter_app/features/language/model/language.dart';

import 'assets/images.dart';

class AppConstants {
  static const String appName = 'Appp';

  /// Languages
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: AppImages.english,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: AppImages.arabic,
        languageName: 'عربى',
        countryCode: 'SA',
        languageCode: 'ar'),
  ];
}
