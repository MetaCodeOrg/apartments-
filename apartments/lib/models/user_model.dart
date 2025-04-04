// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final int? id;
  final String username;
  final String email;
  final String? password;
  final String? phoneNumber;
  final String? token;
  final bool isPhoneVerified;
  final bool isEmailVerified;
  final String? userType;
  final String? verificationCode;

  UserModel({
    this.id,
    required this.username,
    required this.email,
    this.password,
    this.phoneNumber,
    this.token,
    this.isPhoneVerified = false,
    this.isEmailVerified = false,
    this.userType,
    this.verificationCode,
  });

  UserModel copyWith({
    int? id,
    String? username,
    String? email,
    String? password,
    String? phoneNumber,
    String? token,
    bool? isPhoneVerified,
    bool? isEmailVerified,
    String? userType,
    String? verificationCode,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      token: token ?? this.token,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      userType: userType ?? this.userType,
      verificationCode: verificationCode ?? this.verificationCode,
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      'id': id.toString(),
      'username': username,
      'email': email,
      'password': password ?? "",
      'phone_number': phoneNumber ?? "",
      'token': token ?? "",
      'is_phone_verified': isPhoneVerified ? "true" : "false",
      'is_email_verified': isEmailVerified ? "true" : "false",
      'user_type': userType ?? "",
      'verification_code': verificationCode ?? "",
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: int.tryParse(map['id'].toString()),
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      phoneNumber:
          map['phone_number'] != null ? map['phone_number'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      isPhoneVerified:
          bool.tryParse(map['is_phone_verified'].toString()) ?? false,
      isEmailVerified:
          bool.tryParse(map['is_email_verified'].toString()) ?? false,
      userType: map['user_type'] != null ? map['user_type'] as String : null,
      verificationCode: map['verification_code'] != null
          ? map['verification_code'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: $email, password: $password, phoneNumber: $phoneNumber, token: $token, isPhoneVerified: $isPhoneVerified, isEmailVerified: $isEmailVerified, userType: $userType, verificationCode: $verificationCode)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        other.phoneNumber == phoneNumber &&
        other.token == token &&
        other.isPhoneVerified == isPhoneVerified &&
        other.isEmailVerified == isEmailVerified &&
        other.userType == userType &&
        other.verificationCode == verificationCode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phoneNumber.hashCode ^
        token.hashCode ^
        isPhoneVerified.hashCode ^
        isEmailVerified.hashCode ^
        userType.hashCode ^
        verificationCode.hashCode;
  }
}
