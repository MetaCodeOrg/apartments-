import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/core/constants/assets/images.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Get.offAllNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // colors: [Color(0xFF5591AB), Color(0xFF9DCEDC)],
            colors: [Color.fromARGB(255, 98, 151, 174), Color(0xFF9DCEDC)],
          ),
        ),
        child: Center(
          child: Image.asset(
            AppImages.splashLogo,
            width: 200,
          ),
        ),
      ),
    );
  }
}
