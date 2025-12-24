import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

enum ErrorType { http, network, unknown }

class Failur extends Equatable implements Exception {
  const Failur();

  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failur {
  factory NetworkFailure.httpError({
    required final DioException error,
    final StackTrace? stack,
  }) {
    const errorType = ErrorType.http;
    String message = errorType == ErrorType.http
        ? (error.response?.data?['message'] ??
        ((error.response?.data?['error'] is String)
            ? error.response!.data!['error']
            : error.response?.data?['error']['message'] ?? error.response?.statusMessage ?? ''))
        : (error.response?.statusMessage ?? '');
    if (message.isEmpty) {
      message = error.message ?? '';
    }
    return NetworkFailure._(
        error: error, message: message, stack: stack, errorType: errorType, statusCode: error.response?.statusCode);
  }

  factory NetworkFailure.unknownError({
    required final Object error,
    final StackTrace? stack,
  }) =>
      NetworkFailure._(
        error: error,
        message: error.toString(),
        stack: stack,
        errorType: ErrorType.unknown,
      );

  const NetworkFailure._({
    required this.error,
    required this.message,
    this.stack,
    required this.errorType,
    this.statusCode,
  });

  final Object error;
  final String message;
  final StackTrace? stack;
  final ErrorType errorType;
  final int? statusCode;

  @override
  List<Object?> get props => [
    error,
    message,
    errorType,
    statusCode,
  ];
}
