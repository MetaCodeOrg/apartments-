import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF5097B5),
  primaryColorDark: const Color(0xFF5591AB),
  cardColor: const Color(0xFF303030),
  scaffoldBackgroundColor: const Color(0xFF121212),
  drawerTheme: const DrawerThemeData(
    shadowColor: Color(0xFF303030),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFF303030),
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  disabledColor: Colors.grey[600],
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFF5097B5),
    secondary: Colors.teal[700] ?? const Color(0xFF00796B),
  ),
);
