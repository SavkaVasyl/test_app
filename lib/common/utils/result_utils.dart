class Result<T> {

  factory Result.success(final T value) => Result._(value, null);

  Result._(this.value, this.error);
  factory Result.failure(final dynamic error) => Result._(null, error);
  final T? value;
  final dynamic error;

  bool get isSuccess => error == null;
  bool get isFailure => error != null;
}