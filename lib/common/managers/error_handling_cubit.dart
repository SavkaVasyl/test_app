import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/common/data/api_error_interceptor.dart';
import 'package:test_app/common/data/exception.dart';
import 'package:test_app/common/managers/base_cubit.dart';
part 'error_handling_state.dart';

@lazySingleton
class ErrorHandlingCubit extends CubitBase<ErrorHandlingState> {
  ErrorHandlingCubit(final ApiErrorInterceptor apiErrorInterceptor) : super(const ErrorHandlingState()) {
    subscribe(apiErrorInterceptor.errorStream.listen((final error) => emit(ErrorHandlingState(error: error))));
  }
}

