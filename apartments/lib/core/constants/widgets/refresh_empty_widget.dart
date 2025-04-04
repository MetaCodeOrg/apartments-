// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_utils/mc_utils.dart';

class RefreshEmptyWidget extends StatelessWidget {
  final Future Function() onRefresh;
  final String emptyText;
  final IconData? icon;
  final ScrollController? controller;
  const RefreshEmptyWidget({
    super.key,
    required this.onRefresh,
    required this.emptyText,
    this.icon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:onRefresh,
      child: SingleChildScrollView(
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(icon!=null)
              Icon(
                icon,
                size: 70.sp,
                color: Get.theme.bottomNavigationBarTheme.selectedItemColor,
              ),

              SizedBox(
                height: 15.h,
              ),
              McText(
                txt: emptyText.tr,
                fontSize: 16.sp,
                color: Get.theme.bottomNavigationBarTheme.selectedItemColor,
              ),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
