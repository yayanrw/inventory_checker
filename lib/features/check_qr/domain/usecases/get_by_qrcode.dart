import 'package:dartz/dartz.dart';
import 'package:inventory_checker/core/utils/error/failure.dart';
import 'package:inventory_checker/features/check_qr/domain/entities/check_qr.dart';
import 'package:inventory_checker/features/check_qr/domain/repositories/check_qr_repository.dart';

class GetByQrCode {
  late final CheckQrRepository _checkQrRepository;

  GetByQrCode(this._checkQrRepository);

  Future<Either<Failure, CheckQr>> execute(String qrcode) async {
    return await _checkQrRepository.getByQrCode(qrcode);
  }
}
