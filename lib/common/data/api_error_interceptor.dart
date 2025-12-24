import 'dart:async';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'exception.dart';

@lazySingleton
class ApiErrorInterceptor extends QueuedInterceptorsWrapper {
  ApiErrorInterceptor();

  final _errorStreamController = StreamController<NetworkFailure>.broadcast();

  Stream<NetworkFailure> get errorStream => _errorStreamController.stream;

  @override
  void onError(final DioException err, final ErrorInterceptorHandler handler) {
    _errorStreamController.add(NetworkFailure.httpError(error: err));
    handler.next(err);
  }

  @override
  void onRequest(final RequestOptions options, final RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(final Response response, final ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
