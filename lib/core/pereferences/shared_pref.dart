import 'dart:convert';

import 'package:flutter_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;
  static const user = "user";
  static const isLogin = "isLogin";
  static const showSplash = "showSplash";
  // static const userId = "userID";
  // static const email = "email";
  // static const password = "password";
  // static const token = "token";
  static const localLange = "localLange";
  static const themeApp = "themeApp";
  // static const username = "username";
  // static const phoneNumber = "phoneNumber";

  static initPref() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool getBoolean(String key) {
    return _prefs.getBool(key) ?? false;
  }

  static Future<void> setBoolean(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  static String getString(String key) {
    return _prefs.getString(key) ?? "";
  }

  static Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static Future<void> setListString(String key, List<String>? value) async {
    await _prefs.setStringList(key, value ?? []);
  }

  static List<String> getListString(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  static int getInt(String key) {
    return _prefs.getInt(key) ?? 0;
  }

  static Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  static Future<void> clearSharPreference() async {
    var locale = getString(localLange);

    await _prefs.clear();
    setBoolean(showSplash, true);
    setString(localLange, locale);
  }

  static Future<void> clearKeyData(String key) async {
    await _prefs.remove(key);
  }

  static Future<void> setDataUser(UserModel userModel) async {
    // log("${userModel.toJson()}8888888888888888888888");
    var userEncode = jsonEncode(userModel.toJson());
    await _prefs.setString(user, userEncode);
  }

  static UserModel? getDataUser() {
    var data = _prefs.getString(user);
    if (data != null && data.isNotEmpty) {
      var userDecode = jsonDecode(data);
      UserModel userModel = UserModel.fromJson(userDecode);

      return userModel;
    } else {
      return null;
    }
  }
}
