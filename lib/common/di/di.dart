import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:test_app/common/data/api_error_interceptor.dart';
import 'package:test_app/common/data/api_login_interceptor.dart';

import 'di.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit(initializerName: 'setupDependencies', preferRelativeImports: true, asExtension: false)
void configureDependencies() => setupDependencies(serviceLocator);

@module
abstract class AppModule {
  @lazySingleton
  Logger provideLogger() => Logger(
    filter: kDebugMode ? DevelopmentFilter() : ProductionFilter(),
    printer: PrettyPrinter(methodCount: 0, dateTimeFormat: DateTimeFormat.dateAndTime),
  );
}

@module
abstract class NetworkModule {
  @Named('baseUrl')
  String get baseUrl => '';

  @lazySingleton
  Dio provideDio(
    @Named('baseUrl') final String baseUrl,
    final ApiLoggingInterceptor loggingInterceptor,
    final ApiErrorInterceptor errorInterceptor,
  ) {
    final dio = Dio(
      BaseOptions(
        headers: {'accept': 'text/plain', 'Content-Type': 'application/json-patch+json'},
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: 60000),
        receiveTimeout: const Duration(milliseconds: 120000),
      ),
    );
    dio.interceptors.addAll([loggingInterceptor, errorInterceptor]);
    return dio;
  }
}
