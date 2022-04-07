import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_checker/features/check_qr/data/datasources/check_qr_remote_datasource.dart';
import 'package:inventory_checker/features/check_qr/data/repositories/check_qr_repository_impl.dart';
import 'package:inventory_checker/features/check_qr/domain/repositories/check_qr_repository.dart';
import 'package:inventory_checker/features/check_qr/domain/usecases/get_by_qrcode.dart';
import 'package:inventory_checker/features/check_qr/presentation/provider/check_qr_notifier.dart';
import 'package:inventory_checker/features/login/data/datasources/login_remote_datasource.dart';
import 'package:inventory_checker/features/login/data/repositories/login_repository_impl.dart';
import 'package:inventory_checker/features/login/domain/repositories/login_repository.dart';
import 'package:inventory_checker/features/login/domain/usecases/get_login.dart';
import 'package:inventory_checker/features/login/presentation/provider/login_notifier.dart';

final locator = GetIt.instance;
void init() {
  /// provider
  locator.registerFactory(() => LoginNotifier(getLogin: locator()));
  locator.registerFactory(() => CheckQrNotifier(getByQrCode: locator()));

  /// usecases
  locator.registerLazySingleton(() => GetLogin(locator()));
  locator.registerLazySingleton(() => GetByQrCode(locator()));

  /// repository
  locator.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginRemoteDataSource: locator()));
  locator.registerLazySingleton<CheckQrRepository>(
      () => CheckQrRepositoryImpl(checkQrRemoteDataSource: locator()));

  /// data sources
  locator.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<CheckQrRemoteDataSource>(
      () => CheckQrRemoteDataSourceImpl(client: locator()));

  /// network
  locator.registerLazySingleton(() => http.Client());
}
