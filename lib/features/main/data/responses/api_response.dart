import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class ApiResponse<T> {
  ApiResponse({required this.success, required this.data});

  factory ApiResponse.fromJson(final Map<String, dynamic> json, final T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
  final bool success;
  final T data;
}
