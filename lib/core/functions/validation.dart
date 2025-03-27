import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return '${"empty".tr} ${type.tr}';
  }

  if (val.length < min) {
    return "${"bigger".tr} $min";
  }

  if (val.length > max) {
    return "${"less".tr} $max";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "user_name_error".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "enter_a_valid_email_address".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "invalid_phone_number".tr;
    }
  }

  if (type == "password") {
    if (!GetUtils.isPassport(val)) {
      return "password_should_be".tr;
    }
  }
}
