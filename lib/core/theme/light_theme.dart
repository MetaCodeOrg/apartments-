import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF5097B5),
  primaryColorDark: const Color(0xFF5591AB),
  cardColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  drawerTheme: const DrawerThemeData(
    shadowColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  disabledColor: Colors.grey,
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF5097B5),
    secondary: Colors.teal[700] ?? const Color(0xFF00796B),
  ),
);
