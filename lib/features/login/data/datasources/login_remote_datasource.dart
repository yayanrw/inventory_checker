import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_checker/core/config/apps_config.dart';
import 'package:inventory_checker/core/utils/error/exceptions.dart';
import 'package:inventory_checker/features/login/data/models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> getLogin(String username, String password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  late final http.Client client;

  LoginRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginModel> getLogin(String username, String password) async {
    final response = await client.post(
      Uri.parse('${AppsConfig.baseUrl}/auth'),
      body: {
        'user_id': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
