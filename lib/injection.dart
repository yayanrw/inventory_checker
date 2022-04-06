import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_checker/features/login/data/datasources/login_remote_datasource.dart';
import 'package:inventory_checker/features/login/data/repositories/login_repository_impl.dart';
import 'package:inventory_checker/features/login/domain/repositories/login_repository.dart';
import 'package:inventory_checker/features/login/domain/usecases/get_login.dart';
import 'package:inventory_checker/features/login/presentation/provider/login_notifier.dart';

final locator = GetIt.instance;
void init() {
  /// provider
  locator.registerFactory(() => LoginNotifier(getLogin: locator()));

  /// usecases
  locator.registerLazySingleton(() => GetLogin(locator()));

  /// repository
  locator.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginRemoteDataSource: locator()));

  /// data sources
  locator.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(client: locator()));

  /// network
  locator.registerLazySingleton(() => http.Client());
}
