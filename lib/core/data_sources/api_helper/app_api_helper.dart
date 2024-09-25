import 'package:dio/dio.dart';

import '../models/base_response/base_response.dart';
import '../models/pagination_model/pagination_model.dart';
import '../utils/enum.dart';


abstract class AppApiHelper {
  ///[injectToken] in login route we wont need token in header so we pass this parameter [false] value
  Future<BaseResponse<T>> performPostRequest<T>(
      {required String endpoint,
      required T Function(Map<String, dynamic>) fromJson,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      bool injectToken = true});

  Future<BaseResponse<T>> performPostListRequest<T>(
      {required String endpoint,
        required T Function(List<dynamic>) fromJson,
        Map<String, dynamic>? data,
        Map<String, dynamic>? queryParameters});

  Future<BaseResponse<T>> performPostFormDataRequest<T>({
    required String endpoint,
    required T Function(Map<String, dynamic>) fromJson,
    required FormData data,
    Map<String, dynamic>? queryParameters,
  });

  Future<BaseResponse<T>> performPutRequest<T>(
      {required String endpoint,
      required T Function(Map<String, dynamic>) fromJson,
      required Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters});

  Future<BaseResponse<T>> performPutFormDataRequest<T>(
      {required String endpoint,
      required T Function(Map<String, dynamic>) fromJson,
      required FormData data,
      Map<String, dynamic>? queryParameters});

  Future<BaseResponse<T>> performPatchFormDataRequest<T>(
      {required String endpoint,
      required T Function(Map<String, dynamic>) fromJson,
      required FormData? data,
      Map<String, dynamic>? queryParameters});

  Future<BaseResponse<T>> performPatchRequestJSON<T>(
      {required String endpoint,
      required T Function(Map<String, dynamic>) fromJson,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters});

  Future<BaseResponse<T>> performDeleteRequest<T>(
      {required String endpoint,
      required T Function(Map<String, dynamic>) fromJson,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters});

  Future<BaseResponse<T>> performGetRequest<T>(
      {required String endpoint,
      required T Function(Map<String, dynamic>) fromJson,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters});

  Future<BaseResponse<T>> performGetListRequest<T>(
      {required String endpoint,
      required T Function(List<dynamic>) fromJson,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters});

  Future<BasePaginationModel<T>> performGetPagination<T>({
    required String endpoint,
    required T Function(Map<String, dynamic>) fromJson,
    required PaginationTypes paginationTypes,
    String? listName,
    Map<String, dynamic>? queryParameters,
  });
}
