import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_pagenation_params.freezed.dart';
part 'get_pagenation_params.g.dart';

@freezed
class GetPaginationParams with _$GetPaginationParams {
  const factory GetPaginationParams({
    required int page,
    @Default(30) int? per_page,
  }) = _GetPaginationParams;

  factory GetPaginationParams.fromJson(Map<String, dynamic> json) =>
      _$GetPaginationParamsFromJson(json);

  // @override
  // Map<String, dynamic> toJson() => _$$GetPaginationParamsImplToJson(this); // Use the generated function
}
