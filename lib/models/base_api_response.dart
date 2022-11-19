import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'base_api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseApiResponse<T> {
  String code;
  String info;
  T? data;

  BaseApiResponse({
    this.code = "",
    this.info = "",
    this.data,
  });

  factory BaseApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseApiResponseFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseApiResponseToJson(this, toJsonT);

  @override
  String toString() => 'BaseApiResponse(code: $code, info: $info, data: $data)';
}
