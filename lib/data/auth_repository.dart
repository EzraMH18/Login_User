import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:register_login/models/base_api_response.dart';
import 'package:register_login/models/user_response.dart';

import '../models/user_model.dart';

abstract class AuthRepository {
  Future<BaseApiResponse<UserResponse>> login(User user);
  Future<BaseApiResponse<UserResponse>> register(User user);
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<BaseApiResponse<UserResponse>> login(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('https://api1.sib3.nurulfikri.com/api/login');
    final response = await http.post(url, body: user.toLogin());
    final loginResponse = BaseApiResponse.fromJson(jsonDecode(response.body),
        ((json) => UserResponse.fromJson(json as Map<String, dynamic>)));
    final token = loginResponse.data?.token ?? '';
    if (token.isNotEmpty) {
      await prefs.setString('token', token);
    }
    log(loginResponse.toString());
    return loginResponse;
  }

  @override
  Future<BaseApiResponse<UserResponse>> register(User user) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
