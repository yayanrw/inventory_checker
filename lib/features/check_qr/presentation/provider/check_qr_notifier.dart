import 'package:flutter/cupertino.dart';
import 'package:inventory_checker/core/utils/my_toasts.dart';
import 'package:inventory_checker/core/utils/request_state.dart';
import 'package:inventory_checker/features/check_qr/domain/entities/check_qr.dart';
import 'package:inventory_checker/features/check_qr/domain/usecases/get_by_qrcode.dart';

class CheckQrNotifier extends ChangeNotifier {
  late final GetByQrCode getByQrCode;

  CheckQrNotifier({required this.getByQrCode});

  CheckQr? _checkQr;
  CheckQr? get checkQr => _checkQr;

  late RequestState _checkQrState = RequestState.empty;
  RequestState get checkQrState => _checkQrState;

  String _message = '';
  String get message => _message;

  Future<void> fetchGetByQrCode(String qrcode) async {
    _checkQrState = RequestState.loading;
    notifyListeners();

    final result = await getByQrCode.execute(qrcode);

    result.fold((l) {
      _checkQrState = RequestState.error;
      _message = l.message;
      MyToasts(messages: _message, status: 'error').show();
      notifyListeners();
    }, (r) async {
      _checkQrState = RequestState.loading;
      _checkQr = r;

      if (_checkQr != null) {
        _checkQrState = RequestState.loaded;
        if (_checkQr!.status) {
          notifyListeners();
        } else {
          _checkQrState = RequestState.error;
          _message = _checkQr!.message;
          MyToasts(messages: _message, status: 'error').show();
          notifyListeners();
        }
      }
    });
  }

  Future<void> setNull() async {
    _checkQr = null;
    _message = '';
    notifyListeners();
  }
}
