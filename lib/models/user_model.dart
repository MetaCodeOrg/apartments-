// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String? uuid;
  final String? name;
  final String email;
  final String? password;
  final String? phoneNum;
  final String? token;
  final bool isVerify;
  final String? photo;
  UserModel({
    this.uuid,
    this.name,
    required this.email,
    this.password,
    this.phoneNum,
    this.token,
    required this.isVerify,
    this.photo,
  });

  UserModel copyWith({
    String? uuid,
    String? name,
    String? email,
    String? password,
    String? phoneNum,
    String? token,
    bool? isVerify,
    String? photo,
  }) {
    return UserModel(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNum: phoneNum ?? this.phoneNum,
      token: token ?? this.token,
      isVerify: isVerify ?? this.isVerify,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'name': name,
      'email': email,
      'password': password,
      'phoneNum': phoneNum,
      'token': token,
      'isVerify': isVerify,
      'photo': photo,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      phoneNum: map['phoneNum'] != null ? map['phoneNum'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      isVerify: map['isVerify'] as bool,
      photo: map['photo'] != null ? map['photo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uuid: $uuid, name: $name, email: $email, password: $password, phoneNum: $phoneNum, token: $token, isVerify: $isVerify, photo: $photo)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uuid == uuid &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.phoneNum == phoneNum &&
        other.token == token &&
        other.isVerify == isVerify &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phoneNum.hashCode ^
        token.hashCode ^
        isVerify.hashCode ^
        photo.hashCode;
  }
}
