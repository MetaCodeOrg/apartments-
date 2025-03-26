import 'package:flutter/material.dart';
import 'package:flutter_app/screens/account_type.dart';
import 'package:flutter_app/screens/home/main_screen.dart';
import 'package:flutter_app/screens/home/navigate_bar_screens/about.dart';
import 'package:flutter_app/screens/home/navigate_bar_screens/home.dart';
import 'package:flutter_app/screens/home/navigate_bar_screens/search.dart';
import 'package:flutter_app/screens/home/navigate_bar_screens/setting.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/bindings/initial_buindings.dart';
import 'package:flutter_app/middleware/middle_ware.dart';
import 'package:flutter_app/screens/auth/pages/forget_pass.dart';
import 'package:flutter_app/screens/auth/pages/login.dart';
import 'package:flutter_app/screens/auth/pages/new_pass.dart';
import 'package:flutter_app/screens/auth/pages/sign_up.dart';
import 'package:flutter_app/screens/auth/pages/verfiy_code.dart';
import 'package:flutter_app/shared_pereferences/shared_pref.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefs.initPref();

  bool isUserLoggedIn = SharedPrefs.getBoolean(SharedPrefs.isLogin);
  print('User logged in: $isUserLoggedIn');

  runApp(MyApp(isUserLoggedIn: isUserLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isUserLoggedIn;
  const MyApp({super.key, required this.isUserLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: InitialBinding(),
          initialRoute: isUserLoggedIn ? '/home' : '/login',
          //  initialRoute: 'home',
          // home: AccountType(),
          getPages: [
            GetPage(name: '/login', page: () => Login()),
            GetPage(name: '/register', page: () => SignUp()),
            GetPage(name: '/forget', page: () => ForgetPass()),
            GetPage(name: '/verify', page: () => VerifyCodePage()),
            GetPage(name: '/new_pass', page: () => NewPass()),
            GetPage(name: '/home', page: () => const MainScreen(), middlewares: [AuthMiddleware()]),
            GetPage(name: '/setting', page: () => const SettingsPage()),
            GetPage(name: '/search', page: () => const SearchPage()),
            GetPage(name: '/about', page: () => const AboutPage()),
            GetPage(name: '/homepage', page: () => const HomePage()),
            GetPage(name: '/account_type', page: () => const AccountType()),
          ],
        );
      },
    );
  }
}
