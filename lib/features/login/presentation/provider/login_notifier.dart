import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inventory_checker/core/utils/my_toasts.dart';
import 'package:inventory_checker/core/utils/request_state.dart';
import 'package:inventory_checker/features/login/domain/entities/login.dart';
import 'package:inventory_checker/features/login/domain/usecases/get_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier {
  late final GetLogin getLogin;

  LoginNotifier({required this.getLogin});

  late Login _login;
  Login get login => _login;

  late RequestState _loginState = RequestState.empty;
  RequestState get loginState => _loginState;

  String _message = '';
  String get message => _message;

  String? _username, _email, _name, _token, _expiredToken;

  bool get isAuth {
    if (_token != null &&
        DateTime.parse(_expiredToken!).isAfter(DateTime.now()) &&
        _expiredToken != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> fetchLogin(String username, String password) async {
    _loginState = RequestState.loading;
    notifyListeners();

    final result = await getLogin.execute(username, password);

    result.fold((l) {
      _loginState = RequestState.error;
      _message = l.message;
      MyToasts(messages: _message, status: 'error').show();
      notifyListeners();
    }, (r) async {
      _loginState = RequestState.loading;
      _login = r;

      if (_login.status) {
        _username = _login.data!.username;
        _email = _login.data!.email;
        _name = _login.data!.name;
        _expiredToken = _login.data!.exp.toString();
        _token = _login.data!.token;

        final prefs = await SharedPreferences.getInstance();

        final myMapSPref = json.encode({
          'username': _username,
          'email': _email,
          'name': _name,
          'expiredToken': _expiredToken,
          'token': _token,
        });

        prefs.setString('auth', myMapSPref);
      }

      _loginState = RequestState.loaded;
      notifyListeners();
    });
  }

  Future<void> logOut() async {
    _email = null;
    _name = null;
    _expiredToken = null;
    _token = null;
    _login = const Login(status: false, message: '', data: null);

    final prefs = await SharedPreferences.getInstance();
    prefs.remove('auth');
    notifyListeners();
  }

  Future<void> checkSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final myMapSPref = json.decode(prefs.getString('auth') ?? '{}');

    _username = myMapSPref['username'];
    _email = myMapSPref['email'];
    _name = myMapSPref['name'];
    _expiredToken = myMapSPref['expiredToken'];
    _token = myMapSPref['token'];

    if (_username != null &&
        DateTime.parse(_expiredToken!).isAfter(DateTime.now()) &&
        _expiredToken != null) {
      _login = const Login(status: true, message: '', data: null);
    } else {
      logOut();
    }

    notifyListeners();
  }
}
