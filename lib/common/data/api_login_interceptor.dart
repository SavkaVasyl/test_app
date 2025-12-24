import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/common/utils/print_utils.dart';

@lazySingleton
class ApiLoggingInterceptor extends QueuedInterceptorsWrapper {
  ApiLoggingInterceptor();

  @override
  Future<void> onRequest(final RequestOptions options, final RequestInterceptorHandler handler) async {
    _logPrint('*** Request ***');
    _printKeyValue('uri', options.uri);
    _printKeyValue('method', options.method);
    _printKeyValue('headers', options.headers);
    if (options.data != null) {
      _printKeyValue('data', options.data.toString());
    }
    handler.next(options);
  }

  @override
  void onResponse(final Response response, final ResponseInterceptorHandler handler) {
    _logPrint('*** Response ***');
    _printKeyValue('uri', response.requestOptions.uri);
    _printKeyValue('statusCode', response.statusCode);
    _printKeyValue('response', response.toString());
    handler.next(response);
  }

  @override
  void onError(final DioException err, final ErrorInterceptorHandler handler) {
    _logPrint('*** DioException ***:');
    _logPrint('uri: ${err.requestOptions.uri}');
    _logPrint(err.toString());
    if (err.response != null) {
      _printKeyValue('statusCode', err.response!.statusCode);
      _printKeyValue('response', err.response.toString());
    }
    handler.next(err);
  }

  void _printKeyValue(final String key, final Object? v) => _logPrint('$key: $v');

  void _logPrint(final String message) => printMessage(message);
}
