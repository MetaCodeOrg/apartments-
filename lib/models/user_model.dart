import 'dart:convert';

class UserModel {
  final int? id;
  final String? name;
  final String email;
  String? password;
  final int? phoneNum;

  UserModel({
    this.id,
    this.name,
    required this.email,
    this.password,
    this.phoneNum,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    int? phoneNum,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNum: phoneNum ?? this.phoneNum,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phoneNum': phoneNum,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      phoneNum: map['phoneNum'] != null ? map['phoneNum'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
