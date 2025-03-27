import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/assets/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_utils/mc_utils.dart';

class BarLanguage extends StatelessWidget {
  const BarLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          McImageAssets(
            width: 100.w,
            height: 100.h,
            path: AppImages.logo,
          ),
          SizedBox(
            height: Get.height * 0.040.h,
          ),
          Row(
            children: [
              McText(
                txt: "select_language".tr,
                fontSize: 12.5.sp,
              )
            ],
          )
        ],
      ),
    );
  }
}
