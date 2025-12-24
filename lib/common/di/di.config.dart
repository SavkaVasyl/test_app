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

import '../../features/main/data/datasource/collection_remote_datasource.dart'
    as _i1073;
import '../../features/main/data/datasource/fake_collection_api_service.dart'
    as _i490;
import '../../features/main/data/repository/collection_repository.dart'
    as _i1054;
import '../../features/main/presentation/managers/item_details_cubit.dart'
    as _i814;
import '../../features/main/presentation/managers/my_collection_cubit.dart'
    as _i518;
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
  gh.lazySingleton<_i490.FakeCollectionApiService>(
    () => _i490.FakeCollectionApiService(),
  );
  gh.factory<_i1073.CollectionRemoteDatasource>(
    () => _i1073.UserApiDatasource(gh<_i490.FakeCollectionApiService>()),
  );
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
  gh.factory<_i1054.CollectionRepository>(
    () => _i1054.CollectionRepositoryImpl(
      gh<_i1073.CollectionRemoteDatasource>(),
    ),
  );
  gh.factory<_i814.ItemDetailsCubit>(
    () => _i814.ItemDetailsCubit(gh<_i1054.CollectionRepository>()),
  );
  gh.factory<_i518.MyCollectionCubit>(
    () => _i518.MyCollectionCubit(gh<_i1054.CollectionRepository>()),
  );
  return getIt;
}

class _$AppModule extends _i913.AppModule {}

class _$NetworkModule extends _i913.NetworkModule {}
