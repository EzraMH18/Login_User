import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

import 'user_model.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  User user;
  String token;

  UserResponse({
    required this.user,
    this.token = '',
  });

  Map<String, dynamic> toMap() => {
        'user': user.toJson(),
        'token': token,
      };

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  String toString() {
    return 'Data(user: $user, token: $token)';
  }
}
