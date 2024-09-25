import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  @JsonKey(name: 'code')
  int? code;
  @JsonKey(name: 'info')
  String? info;

  ErrorModel({this.code, this.info});

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
}
