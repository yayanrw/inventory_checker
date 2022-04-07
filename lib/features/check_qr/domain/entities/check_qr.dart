import 'package:equatable/equatable.dart';
import 'package:inventory_checker/features/check_qr/data/models/check_qr_model.dart';

class CheckQr extends Equatable {
  const CheckQr({
    required this.status,
    required this.message,
    this.data,
  });

  final bool status;
  final String message;
  final Data? data;

  @override
  List<Object?> get props => [status, message, data!];
}
