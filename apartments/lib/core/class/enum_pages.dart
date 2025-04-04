enum EnumPages { login, forgetPassword, register, none }

extension PagestExtension on EnumPages {
  // دالة لتحويل Enum إلى نص
  String get text {
    switch (this) {
      case EnumPages.login:
        return 'login';
      case EnumPages.forgetPassword:
        return 'forget_password';
      case EnumPages.register:
        return 'register';
      default:
        return 'none';
    }
  }
}

extension PagestFromTextExtension on EnumPages {
  // دالة لتحويل النص إلى Enum
  static EnumPages fromText(String text) {
    switch (text) {
      case 'login':
        return EnumPages.login;
      case 'forget_password':
        return EnumPages.forgetPassword;
      case 'register':
        return EnumPages.register;
      default:
        return EnumPages.none;
    }
  }
}