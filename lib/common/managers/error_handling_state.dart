part of 'error_handling_cubit.dart';

class ErrorHandlingState extends Equatable {
  const ErrorHandlingState({this.error});

  final Failur? error;

  @override
  List<Object?> get props => [error];
}
