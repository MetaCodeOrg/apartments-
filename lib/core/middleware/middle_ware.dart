import 'package:flutter/widgets.dart';
import 'package:flutter_app/core/pereferences/shared_pref.dart';
import 'package:get/get.dart';

import '../constants/app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (SharedPrefs.getString(SharedPrefs.localLange).isEmpty) {
      return const RouteSettings(name: AppRoutes.langugue);
    }
    if (!SharedPrefs.getBoolean(SharedPrefs.isLogin)) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
