import 'package:json_annotation/json_annotation.dart';

import '../error_model/error_model.dart';

part 'base_response.g.dart'; // Adjust according to your file structure

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  late bool? success;

  @JsonKey(name: 'error')
  final ErrorModel? error;

  T? data;

  @JsonKey(name: 'result')
  final double? result;

  BaseResponse({this.success, this.error, this.data, this.result});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    // Call the generated code to handle standard JSON fields
    final baseResponse = _$BaseResponseFromJson(json, fromJsonT);

    // Handle dynamic data keys (quotes or data)
    baseResponse.data = _parseDataField<T>(json, fromJsonT);

    return baseResponse;
  }

  // Custom function to handle dynamic key ('quotes' or 'data')
  static T? _parseDataField<T>(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    if (json.containsKey('quotes')) {
      return fromJsonT(json['quotes'] as Map<String, dynamic>);
    } else if (json.containsKey('data')) {
      return fromJsonT(json['data'] as Map<String, dynamic>);
    } else {
      return null; // Or throw an exception if desired
    }
  }
}
