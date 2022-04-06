import 'package:dartz/dartz.dart';
import 'package:inventory_checker/core/utils/error/failure.dart';
import 'package:inventory_checker/features/login/domain/entities/login.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> getLogin(String username, String password);
}
