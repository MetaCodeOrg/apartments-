import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app/shared_pereferences/shared_pref.dart';

class AuthController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNum = TextEditingController();
  var showPassIcon = false.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    showPassIcon.value = !showPassIcon.value;
  }

  @override
  void onInit() {
    super.onInit();
    _loadSavedData();
  }

  void _loadSavedData() {
    email.text = SharedPrefs.getString(SharedPrefs.email);
    username.text = SharedPrefs.getString(SharedPrefs.username);
    phoneNum.text = SharedPrefs.getString(SharedPrefs.phoneNumber);
  }

  Future<void> signUpFunc() async {
    try {
      isLoading.value = true;

      await SharedPrefs.setBoolean(SharedPrefs.isLogin, true);
      await SharedPrefs.setString(SharedPrefs.username, username.text);
      await SharedPrefs.setString(SharedPrefs.email, email.text);
      await SharedPrefs.setString(SharedPrefs.password, password.text);
      await SharedPrefs.setString(SharedPrefs.phoneNumber, phoneNum.text);

      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

// void logout() async {
//   await SharedPrefs.setBoolean(SharedPrefs.isLogin, false);
//   await SharedPrefs.setString(SharedPrefs.username, '');
//   // ... مسح باقي البيانات
//   Get.offAllNamed('/login');
// }

  // Future<void> signUpFunc() async {
  //   try {
  //     isLoading.value = true;
  //     // حفظ بيانات المستخدم في SharedPreferences
  //     await SharedPrefs.setBoolean('isLogin', true);
  //     Get.offNamed('/home');
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: const Duration(seconds: 3),
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // Future<void> loginFunc() async {
  //   try {
  //     isLoading.value = true;
  //     // التحقق من بيانات المستخدم (هذا مثال بسيط)
  //     if (email.text == "test@example.com" && password.text == "password") {
  //       await SharedPrefs.setBoolean('isLogin', true);
  //       Get.offNamed('/home');
  //     } else {
  //       Get.snackbar("Error", "Invalid email or password");
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: const Duration(seconds: 3),
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<void> loginFunc() async {
    try {
      isLoading.value = true;

      // استرجاع البيانات المحفوظة
      final savedEmail = SharedPrefs.getString(SharedPrefs.email);
      final savedPassword = SharedPrefs.getString(SharedPrefs.password);
      final savedUsername = SharedPrefs.getString(SharedPrefs.username);
      final savedPhone = SharedPrefs.getString(SharedPrefs.phoneNumber);

      // التحقق من بيانات الدخول مقابل البيانات المحفوظة
      if ((email.text == savedEmail ||
              (username.text == savedUsername && phoneNum.text == savedPhone)) &&
          password.text == savedPassword) {
        await SharedPrefs.setBoolean(SharedPrefs.isLogin, true);
        Get.offAllNamed('/home');
      } else {
        Get.snackbar("Error", "بيانات الدخول غير صحيحة");
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  // Future<void> loginFunc() async {
  //   try {
  //     isLoading.value = true;

  //     // التحقق من بيانات المستخدم (يمكن استبداله بمصادقة Firebase لاحقًا)
  //     if (email.text == "test@example.com" && password.text == "password") {
  //       await SharedPrefs.setBoolean(SharedPrefs.isLogin, true); // تخزين تسجيل الدخول
  //       Get.offAllNamed(
  //           '/home'); // الانتقال إلى الصفحة الرئيسية وإزالة جميع الصفحات السابقة من الذاكرة
  //     } else {
  //       Get.snackbar("Error", "Invalid email or password");
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: const Duration(seconds: 3),
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  void logout() async {
    // لا تمسح جميع البيانات، فقط حالة تسجيل الدخول
    await SharedPrefs.setBoolean(SharedPrefs.isLogin, false);
    clearTextField();
    Get.offAllNamed('/login');
  }

  void clearTextField() {
    username.clear();
    email.clear();
    password.clear();
    phoneNum.clear();
  }
}
