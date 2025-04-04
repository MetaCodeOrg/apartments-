import '../api/api_services.dart';
import '../api/post_get_page.dart';

class AuthApi {
  PostGetPage apiReq;
  AuthApi(this.apiReq);

  postlogin(String email, String password) async {
    var res = await apiReq.dynamicData(url: ApiServices.login, data: {
      "email": email,
      "password": password,
    });
    return res.fold((lef) => lef, (re) => re);
  }

  postRegister(String name, String phone, String email, String password,
      String token) async {
    var res = await apiReq.dynamicData(url: ApiServices.register, data: {
      "username": name,
      "phone_number": phone,
      "email": email,
      "password": password
    });
    return res.fold((lef) => lef, (re) => re);
  }

  forgetPassword(String email) async {
    var res = await apiReq
        .dynamicData(url: ApiServices.forgot, data: {"email": email});
    return res.fold((l) => l, (r) => r);
  }

  verificationCodeEmail(String email, String otp) async {
    var res = await apiReq.dynamicData(
        url: ApiServices.verifyCodeEmail,
        data: {"email": email, "verification_code": otp});
    return res.fold((l) => l, (r) => r);
  }

  sandVerifiyCode(String email) async {
    var res = await apiReq.dynamicData(
        url: ApiServices.sandVerifiyCideEmail, data: {"email": email});
    return res.fold((l) => l, (r) => r);
  }

  resandVerifiyCode(String email) async {
    var res = await apiReq.dynamicData(
        url: ApiServices.resandVerifiyCideEmail, data: {"email": email});
    return res.fold((l) => l, (r) => r);
  }

  restPassword(String password, String email, String token) async {
    var res = await apiReq.dynamicData(url: ApiServices.resetpassword, data: {
      "password": password,
      "email": email,
    }, header: {
      "Authorization": "Bearer $token"
    });
    return res.fold((l) => l, (r) => r);
  }

  getDataProfile(String token) async {
    var res = await apiReq.dynamicData(
        url: ApiServices.profile,
        header: {"Authorization": "Bearer $token"},
        methode: "GET");
    return res.fold((l) => l, (r) => r);
  }

  // updateProfile(UserModel usr) async {
  //   var res = await apiReq.dynamicData(
  //     url: ApiServices.updateProfile,
  //     header: {"Authorization": "Bearer ${usr.token}"},
  //     data: usr.toMapAPI(),
  //   );
  //   return res.fold((l) => l, (r) => r);
  // }

  // changePassword(String currentPassword, String newPassword,
  //     String newPasswordConfirmation, String token) async {
  //   var res = await apiReq.dynamicData(
  //     url: ApiServices.changePassword,
  //     header: {"Authorization": "Bearer $token"},
  //     data: {
  //       "new_password_confirmation": newPasswordConfirmation,
  //       "new_password": newPassword,
  //       "current_password": currentPassword
  //     },
  //   );
  //   return res.fold((l) => l, (r) => r);
  // }

  // deleteAccount(String token, String txt) async {
  //   var res = await apiReq.dynamicData(
  //     url: ApiServices.deleteAccount,
  //     header: {"Authorization": "Bearer ${token}"},
  //     data: {"reason": txt},
  //   );
  //   return res.fold((l) => l, (r) => r);
  // }
}
