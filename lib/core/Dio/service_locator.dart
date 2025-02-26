import 'package:get_it/get_it.dart';
import 'package:salon_app/core/network/api.dart';
import 'package:salon_app/core/network/app_dio.dart';
import 'package:salon_app/features/Provider_App/auth/data/abstract_auth_remote.dart';
import 'package:salon_app/features/Provider_App/auth/data/auth_remote_data_source.dart';




final getInstance = GetIt.instance;

initDependencyInjection() {
  getInstance.registerLazySingleton<AppDio>(() => AppDio());

  getInstance.registerLazySingleton<API>(() => API(dio: getInstance<AppDio>().dio));

  getInstance.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImplement(api: getInstance<API>()));
}
