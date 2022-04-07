import 'dart:convert';
import 'dart:io';
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
    var headers = {
      HttpHeaders.authorizationHeader: 'Bearer ${AppsConfig.token}',
    };

    final response = await client.post(
      Uri.parse('${AppsConfig.baseUrlKosme}/SJP/qrcode'),
      headers: headers,
      body: {
        'qrcode': qrcode,
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
