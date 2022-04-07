import 'package:flutter/material.dart';
import 'package:inventory_checker/core/utils/my_toasts.dart';
import 'package:inventory_checker/core/utils/request_state.dart';
import 'package:inventory_checker/features/login/domain/entities/login.dart';
import 'package:inventory_checker/features/login/domain/usecases/get_login.dart';

class LoginNotifier extends ChangeNotifier {
  late final GetLogin getLogin;

  LoginNotifier({required this.getLogin});

  late Login _login;
  Login get login => _login;

  late RequestState _loginState = RequestState.empty;
  RequestState get loginState => _loginState;

  String _message = '';
  String get message => _message;

  Future<void> fetchLogin(String username, String password) async {
    _loginState = RequestState.loading;
    notifyListeners();

    final result = await getLogin.execute(username, password);

    result.fold((l) {
      _loginState = RequestState.error;
      _message = l.message;
      MyToasts(messages: _message, status: 'error').show();
      notifyListeners();
    }, (r) {
      _loginState = RequestState.loading;
      _login = r;
      _loginState = RequestState.loaded;
      notifyListeners();
    });
  }
}
