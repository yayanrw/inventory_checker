import 'package:dartz/dartz.dart';
import 'package:inventory_checker/core/utils/error/failure.dart';
import 'package:inventory_checker/features/check_qr/domain/entities/check_qr.dart';

abstract class CheckQrRepository {
  Future<Either<Failure, CheckQr>> getByQrCode(String qrcode);
}
