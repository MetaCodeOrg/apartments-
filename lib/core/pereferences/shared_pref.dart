import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;

  static const isLogin = "isLogin";
  static const showSplash = "showSplash";
  static const userId = "userID";
  static const email = "email";
  static const password = "password";
  static const token = "token";
  static const localLange = "localLange";
  static const themeApp = "themeApp";
  static const username = "username";
  static const phoneNumber = "phoneNumber";

  static initPref() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Get and Set Boolean
  static bool getBoolean(String key) {
    return _prefs.getBool(key) ?? false;
  }

  static Future<void> setBoolean(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  /// Get and Set UserName
  static String getUsername() {
    return _prefs.getString(username) ?? "";
  }

  static Future<void> setUsername(String value) async {
    await _prefs.setString(username, value);
  }

  /// Get and Set Phone_Number
  static String getPhoneNumber() {
    return _prefs.getString(phoneNumber) ?? "";
  }

  static Future<void> setPhoneNumber(String value) async {
    await _prefs.setString(phoneNumber, value);
  }

  /// Get and Set String
  static String getString(String key) {
    return _prefs.getString(key) ?? "";
  }

  static Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  /// Get and Set INT
  static int getInt(String key) {
    return _prefs.getInt(key) ?? 0;
  }

  static Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  static Future<void> clearAll() async {
    await _prefs.clear();
  }
}
