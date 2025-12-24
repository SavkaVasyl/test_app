// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../data/api_error_interceptor.dart' as _i604;
import '../data/api_login_interceptor.dart' as _i149;
import '../managers/error_handling_cubit.dart' as _i199;
import 'di.dart' as _i913;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt setupDependencies(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final appModule = _$AppModule();
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i604.ApiErrorInterceptor>(
    () => _i604.ApiErrorInterceptor(),
  );
  gh.lazySingleton<_i149.ApiLoggingInterceptor>(
    () => _i149.ApiLoggingInterceptor(),
  );
  gh.lazySingleton<_i974.Logger>(() => appModule.provideLogger());
  gh.factory<String>(() => networkModule.baseUrl, instanceName: 'baseUrl');
  gh.lazySingleton<_i199.ErrorHandlingCubit>(
    () => _i199.ErrorHandlingCubit(gh<_i604.ApiErrorInterceptor>()),
  );
  gh.lazySingleton<_i361.Dio>(
    () => networkModule.provideDio(
      gh<String>(instanceName: 'baseUrl'),
      gh<_i149.ApiLoggingInterceptor>(),
      gh<_i604.ApiErrorInterceptor>(),
    ),
  );
  return getIt;
}

class _$AppModule extends _i913.AppModule {}

class _$NetworkModule extends _i913.NetworkModule {}
