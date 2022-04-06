import 'package:dartz/dartz.dart';
import 'package:inventory_checker/core/utils/error/failure.dart';
import 'package:inventory_checker/features/login/domain/entities/login.dart';
import 'package:inventory_checker/features/login/domain/repositories/login_repository.dart';

class GetLogin {
  late final LoginRepository _loginRepository;

  GetLogin(this._loginRepository);

  Future<Either<Failure, Login>> execute(
      String username, String password) async {
    return await _loginRepository.getLogin(username, password);
  }
}
