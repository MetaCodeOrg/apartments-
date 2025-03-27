import 'package:flutter_app/core/bindings/initial_buindings.dart';
import 'package:flutter_app/core/middleware/middle_ware.dart';
import 'package:flutter_app/features/auth/screen/account_type.dart';
import 'package:flutter_app/features/auth/screen/forget_pass.dart';
import 'package:flutter_app/features/auth/screen/login.dart';
import 'package:flutter_app/features/auth/screen/new_pass.dart';
import 'package:flutter_app/features/auth/screen/sign_up.dart';
import 'package:flutter_app/features/auth/screen/verfiy_code.dart';
import 'package:flutter_app/features/home/home_screen.dart';
import 'package:flutter_app/features/about/about.dart';
import 'package:flutter_app/features/home/screen/home_page.dart';
import 'package:flutter_app/features/search/search.dart';
import 'package:flutter_app/features/setting/setting.dart';
import 'package:get/get.dart';

import '../../features/language/screen/home_language.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forget';
  static const String verifyCode = '/verify';
  static const String newPassword = '/new_pass';
  static const String settings = '/setting';
  static const String search = '/search';
  static const String about = '/about';
  static const String homePage = '/homepage';
  static const String accountType = '/account_type';
  static const String langugue = "/lang";

  static List<GetPage<dynamic>> getPages = [
    GetPage(
        name: home,
        page: () => const HomeScreen(),
        middlewares: [AuthMiddleware()],
        binding: InitialBinding()),
    GetPage(name: login, page: () => Login(), binding: InitialBinding()),
    GetPage(name: register, page: () => SignUp()),
    GetPage(name: forgetPassword, page: () => ForgetPass()),
    GetPage(name: verifyCode, page: () => VerifyCodePage()),
    GetPage(name: newPassword, page: () => NewPass()),
    GetPage(name: settings, page: () => const SettingsPage()),
    GetPage(name: search, page: () => const SearchPage()),
    GetPage(name: about, page: () => const AboutPage()),
    GetPage(name: homePage, page: () => const HomePage()),
    GetPage(name: accountType, page: () => const AccountType()),
    GetPage(name: langugue, page: () => const HomeLanguage()),
  ];
}
