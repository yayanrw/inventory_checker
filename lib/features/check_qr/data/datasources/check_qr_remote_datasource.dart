import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_checker/core/config/apps_config.dart';
import 'package:inventory_checker/core/utils/error/exceptions.dart';
import 'package:inventory_checker/features/check_qr/data/models/check_qr_model.dart';

abstract class CheckQrRemoteDataSource {
  Future<CheckQrModel> getByQrCode(String qrcode);
}

class CheckQrRemoteDataSourceImpl implements CheckQrRemoteDataSource {
  late final http.Client client;

  CheckQrRemoteDataSourceImpl({required this.client});

  @override
  Future<CheckQrModel> getByQrCode(String qrcode) async {
    final response = await client.post(
      Uri.parse('${AppsConfig.baseUrlKosme}/SJP/qrcode'),
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJ1c2VybmFtZSI6InN1cGVydXNlciIsImVtYWlsIjoic3VwZXJ1c2VyQG1zZ2xvd2lkLmNvbSIsIm5hbWUiOiJTdXBlciBVc2VyIiwidGltZXN0YW1wIjoxNjQ5MzU2NDA3LCJ0aW1lX2V4cGlyYXRpb24iOiI1MjU5NjAiLCJleHAiOiIyMDIzLTA0LTA4IDA3OjMzOjI3In0.yLjG0arzVQoXvBeEYbL1pUxmXIwRMRXLmfWf4F0S4TM'
      },
      body: {
        'qrcode': 'msgl.io/00007653',
      },
    );

    if (response.statusCode == 200) {
      return CheckQrModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      throw "Unauthorized";
    } else {
      throw ServerException();
    }
  }
}
