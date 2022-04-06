// To parse this JSON data, do
//
//     final LoginModel = loginModelFromJson(jsonString);

import 'package:equatable/equatable.dart';
import 'dart:convert';

import 'package:inventory_checker/features/login/domain/entities/login.dart';

loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel extends Equatable {
  const LoginModel({
    required this.status,
    required this.message,
    this.data,
  });

  final bool status;
  final String message;
  final Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };

  Login toEntity() {
    return Login(
      status: status,
      message: message,
      data: data,
    );
  }

  @override
  List<Object> get props => [status, message, data!];
}

class Data extends Equatable {
  const Data({
    required this.username,
    required this.email,
    required this.name,
    required this.exp,
    required this.token,
  });

  final String username;
  final String email;
  final String name;
  final DateTime exp;
  final String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        email: json["email"],
        name: json["name"],
        exp: DateTime.parse(json["exp"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "name": name,
        "exp": exp.toIso8601String(),
        "token": token,
      };

  @override
  List<Object> get props => [username, email, name, exp, token];
}
