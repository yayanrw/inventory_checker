import 'package:dartz/dartz.dart';
import 'package:inventory_checker/core/utils/error/exceptions.dart';
import 'package:inventory_checker/core/utils/error/failure.dart';
import 'package:inventory_checker/core/utils/my_strings.dart';
import 'package:inventory_checker/features/check_qr/data/datasources/check_qr_remote_datasource.dart';
import 'package:inventory_checker/features/check_qr/domain/entities/check_qr.dart';
import 'dart:io';

import 'package:inventory_checker/features/check_qr/domain/repositories/check_qr_repository.dart';

class CheckQrRepositoryImpl implements CheckQrRepository {
  final CheckQrRemoteDataSource checkQrRemoteDataSource;

  CheckQrRepositoryImpl({required this.checkQrRemoteDataSource});

  @override
  Future<Either<Failure, CheckQr>> getByQrCode(String qrcode) async {
    try {
      final result = await checkQrRemoteDataSource.getByQrCode(qrcode);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure(MyStrings.failedToConnect));
    }
  }
}
