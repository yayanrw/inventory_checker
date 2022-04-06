import 'package:equatable/equatable.dart';
import 'package:inventory_checker/features/login/data/models/login_model.dart';

class Login extends Equatable {
  const Login({
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
