import 'package:flutter/widgets.dart';
import 'package:flutter_app/shared_pereferences/shared_pref.dart';
import 'package:get/get.dart';

// class AuthMiddleware extends GetMiddleware {
//   @override
//   RouteSettings? redirect(String? route) {
//     if (!SharedPrefs.getBoolean(SharedPrefs.isLogin)) {
//       return const RouteSettings(name: '/login');
//     }
//     return const RouteSettings(
//         name: '/home'); // السماح بالانتقال للصفحة المطلوبة إذا كان المستخدم مسجلاً
//   }
// }

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final isLogin = SharedPrefs.getBoolean(SharedPrefs.isLogin);

    if (!isLogin && route != '/login') {
      return const RouteSettings(name: '/login');
    }

    if (isLogin && route == '/login') {
      return const RouteSettings(name: '/home');
    }

    return null;
  }
}
