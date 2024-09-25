import 'package:json_annotation/json_annotation.dart';

import '../../utils/enum.dart';

part 'pagination_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BasePaginationModel<T> {
  final List<T> data;
  int total;
  @JsonKey(name: 'page')
  int page;

  //int limit;
  @JsonKey(name: "pages")
  int pages;

  @JsonKey(name: "per_page")
  String perPage;

  PaginationTypes? paginationType;

  BasePaginationModel(
      {required this.data,
      required this.total,
      required this.page,
      required this.pages,
      required this.perPage,
      this.paginationType});

  factory BasePaginationModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BasePaginationModelFromJson(json, fromJsonT);
}
