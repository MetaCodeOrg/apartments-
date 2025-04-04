import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_utils/mc_utils.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? children;
  final double? titleSpace;
  final Color? color;
  final Widget? widget;
  final double? appBarWidth;
  final bool isCenter;
  final bool isBlod;
  final double sTitle;
  final Function()? onTapWidget;
  const AppbarWidget(
      {super.key,
      this.title,
      this.color,
      this.children,
      this.widget,
      this.onTapWidget,
      this.appBarWidth,
      this.isCenter = false,
      this.isBlod = true,
      this.sTitle = 16,
      this.titleSpace});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      leadingWidth: appBarWidth,
      titleSpacing: titleSpace,
      title: title != null
          ? McText(
              txt: title!.tr,
              blod: isBlod,
              fontSize: sTitle.sp,
            )
          : null,
      leading:
          widget != null ? InkWell(onTap: onTapWidget, child: widget) : null,
      centerTitle: isCenter,
      actions: children ??
          [
            Row(
              children: [
                // InkWell(
                //     onTap: () =>
                //         Get.find<HomeController>().showDrawer(enumsDrawer),
                //     child: const Icon(Icons.menu)),
                // SizedBox(
                //   width: 10.w,
                // ),
                // InkWell(
                //     onTap: () => Get.toNamed('/scanner'),
                //     child: const Icon(Icons.qr_code_scanner)),
                // SizedBox(
                //   width: 15.w,
                // )
              ],
            )
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
