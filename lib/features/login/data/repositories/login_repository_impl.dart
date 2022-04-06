import 'package:dartz/dartz.dart';
import 'package:inventory_checker/core/utils/error/exceptions.dart';
import 'package:inventory_checker/core/utils/error/failure.dart';
import 'package:inventory_checker/features/login/data/datasources/login_remote_datasource.dart';
import 'package:inventory_checker/features/login/domain/entities/login.dart';
import 'dart:io';

import 'package:inventory_checker/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({required this.loginRemoteDataSource});

  @override
  Future<Either<Failure, Login>> getLogin(
      String username, String password) async {
    try {
      final result = await loginRemoteDataSource.getLogin(username, password);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
