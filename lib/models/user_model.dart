import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String email;
  String password;
  String handphone;
  String role;

  User({
    this.id = 0,
    this.name = "",
    this.email = "",
    this.password = "",
    this.handphone = "",
    this.role = "",
  });

  Map<String, dynamic> toLogin() => {
        "email": email,
        "password": password,
      };

  Map<String, dynamic> toRegister() => {
        "name": name,
        "email": email,
        "handphone": handphone,
        "passwor": password,
      };

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password, handphone: $handphone, role: $role)';
  }
}
