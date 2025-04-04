class ApiServices {
  static String server = "http://192.168.43.223:8000/api";
  static String serverImage = "http://192.168.43.223:8000";

  static const headers = {
    'Accept': 'application/json',
    'Content-type': 'application/json',
  };
  static String login = "$server/login";
  static String register = "$server/register";
  static String forgot = "$server/forgot-password";
  // static String verifyCode = "$server/verify-code";
  static String verifyCodeEmail = "$server/verify-email";
  static String sandVerifiyCideEmail = "$server/send-verification-code";
  static String resandVerifiyCideEmail = "$server/resend-verification-code";
  static String resetpassword = "$server/reset-password";
  static String profile = "$server/user/profile";
  static String apartments = "$server/apartments";
  static String request = "$server/requests";
}
