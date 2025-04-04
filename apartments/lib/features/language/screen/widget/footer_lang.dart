import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_constants.dart';
import 'package:flutter_app/core/pereferences/shared_pref.dart';
import 'package:flutter_app/features/language/controller/localization_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_utils/mc_utils.dart';

class FooterLang extends StatelessWidget {
  const FooterLang({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<LocalizationController>();
    return Column(
      children: [
        McText(
          txt: "you_can_change_language".tr,
          blod: false,
          color: Theme.of(context).disabledColor,
          fontSize: 11.sp,
        ),
        SizedBox(
          height: 5.h,
        ),
        McButton(
          txt: "save".tr,
          blod: true,
          color: Theme.of(context).cardColor,
          colorBorder: Theme.of(context).primaryColor,
          colorBtn: Theme.of(context).primaryColor,
          raudis: BorderRadius.circular(5),
          fontSize: 15.sp,
          onTap: () {
            bool isBack =
                SharedPrefs.getString(SharedPrefs.localLange).isNotEmpty;
            var locale = Locale(
              AppConstants.languages[controller.selectedIndex].languageCode!,
              AppConstants.languages[controller.selectedIndex].countryCode,
            );
            controller.saveCacheLanguage(locale);
            if (isBack) {
              Get.back();
            } else {
              Get.offAllNamed('/');
            }
          },
        ),
      ],
    );
  }
}
