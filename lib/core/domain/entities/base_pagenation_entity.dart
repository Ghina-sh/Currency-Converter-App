class BasePaginationEntity {
  final List<dynamic> data;
  int total;
  int page;
  int pages;
  String perPage;

  BasePaginationEntity(
      {required this.data,
      required this.total,
      required this.page,
      required this.pages,
      required this.perPage});
}
