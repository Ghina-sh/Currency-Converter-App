
abstract class FailureInterface {
  final String message;

  FailureInterface(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends FailureInterface {
  ServerFailure(String message) : super(message);
}

class GeneralFailure extends FailureInterface {
  GeneralFailure(String message) : super(message);
}

// You can add as many specific failures as needed

// // ignore_for_file: non_constant_identifier_names, constant_identifier_names
// import 'package:dio/dio.dart';
//
// import '../../../domain/entities/failure.dart';
// import '../../../utils/resources/local_messages_strings_manager.dart';
//
//
// class ErrorHandler implements Exception {
//   late Failure failure;
//
//   ErrorHandler.handle(dynamic error) {
//
//     if (error is DioException) {
//       // dio error so its an error from response of the API or from dio itself
//       failure = _handleError(error);
//     } else {
//       // default error
//       failure = DataSource.DEFAULT.getFailure();
//     }
//   }
// }
// Failure _handleError(DioException error) {
//   switch (error.type) {
//     case DioExceptionType.connectionTimeout:
//       return DataSource.CONNECT_TIMEOUT.getFailure();
//     case DioExceptionType.sendTimeout:
//       return DataSource.SEND_TIMEOUT.getFailure();
//     case DioExceptionType.receiveTimeout:
//       return DataSource.RECIEVE_TIMEOUT.getFailure();
//     case DioExceptionType.badResponse:
//       switch (error.response?.statusCode ?? 0) {
//         case ResponseCode.UNAUTORISED:
//           return DataSource.UNAUTORISED.getFailure();
//         case ResponseCode.FORBIDDEN:
//           return DataSource.FORBIDDEN.getFailure();
//         case ResponseCode.BAD_REQUEST:
//           return DataSource.BAD_REQUEST.getFailure();
//         case ResponseCode.NO_CONTENT:
//           return DataSource.NO_CONTENT.getFailure();
//         case ResponseCode.NOT_FOUND:
//           return DataSource.NOT_FOUND.getFailure();
//         case ResponseCode.REDIRECT:
//           return DataSource.REDIRECT.getFailure();
//         default:
//           if (error.response != null &&
//               error.response?.statusCode != null &&
//               error.response?.statusMessage != null) {
//             print(error.response?.statusMessage);
//             return Failure(
//                 error.response?.statusCode ?? 0,
//                 error.response?.data ??
//                     error.response?.statusMessage ??
//                     "");
//           } else {
//             return DataSource.DEFAULT.getFailure();
//           }
//       }
//     case DioExceptionType.cancel:
//       return DataSource.CANCEL.getFailure();
//     case DioExceptionType.unknown:
//       return DataSource.DEFAULT.getFailure();
//
//     case DioExceptionType.badCertificate:
//       return DataSource.DEFAULT.getFailure();
//     case DioExceptionType.connectionError:
//       return DataSource.NO_INTERNET_CONNECTION.getFailure();
//   }
// }
//
//
// enum DataSource {
//   SUCCESS,
//   NO_CONTENT,
//   BAD_REQUEST,
//   FORBIDDEN,
//   UNAUTORISED,
//   NOT_FOUND,
//   INTERNAL_SERVER_ERROR,
//   CONNECT_TIMEOUT,
//   CANCEL,
//   RECIEVE_TIMEOUT,
//   SEND_TIMEOUT,
//   CACHE_ERROR,
//   NO_INTERNET_CONNECTION,
//   REDIRECT,
//   DEFAULT
// }
//
// extension DataSourceExtension on DataSource {
//   Failure getFailure() {
//     switch (this) {
//       case DataSource.SUCCESS:
//         return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
//       case DataSource.NO_CONTENT:
//         return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
//       case DataSource.BAD_REQUEST:
//         return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
//       case DataSource.FORBIDDEN:
//         return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
//       case DataSource.UNAUTORISED:
//         // redirectToLogin();
//         return Failure(ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED);
//       case DataSource.NOT_FOUND:
//         return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
//       case DataSource.INTERNAL_SERVER_ERROR:
//         return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
//             ResponseMessage.INTERNAL_SERVER_ERROR);
//       case DataSource.CONNECT_TIMEOUT:
//         return Failure(
//             ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
//       case DataSource.CANCEL:
//         return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
//       case DataSource.RECIEVE_TIMEOUT:
//         return Failure(
//             ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
//       case DataSource.SEND_TIMEOUT:
//         return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
//       case DataSource.CACHE_ERROR:
//         return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
//       case DataSource.NO_INTERNET_CONNECTION:
//         return Failure(ResponseCode.NO_INTERNET_CONNECTION,
//             ResponseMessage.NO_INTERNET_CONNECTION);
//       case DataSource.DEFAULT:
//         return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
//       case DataSource.REDIRECT:
//         return Failure(ResponseCode.REDIRECT, ResponseMessage.REDIRECT);
//
//     }
//   }
// }
//
// class ResponseCode {
//   static const int SUCCESS = 200; // success with data
//   static const int NO_CONTENT = 201; // success with no data (no content)
//   static const int BAD_REQUEST = 400; // failure, API rejected request
//   static const int UNAUTORISED = 401; // failure, user is not authorised
//   static const int FORBIDDEN = 403; //  failure, API rejected request
//   static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
//   static const int NOT_FOUND = 404;
//   static const int REDIRECT = 302;// failure, not found
//
//   // local status code
//   static const int CONNECT_TIMEOUT = -1;
//   static const int CANCEL = -2;
//   static const int RECIEVE_TIMEOUT = -3;
//   static const int SEND_TIMEOUT = -4;
//   static const int CACHE_ERROR = -5;
//   static const int NO_INTERNET_CONNECTION = -6;
//   static const int DEFAULT = -7;
// }
//
// class ResponseMessage {
//   static  String SUCCESS = AppLocalMessagesStringsManager().success; // success with data
//   static  String NO_CONTENT =
//       AppLocalMessagesStringsManager().success; // success with no data (no content)
//   static  String BAD_REQUEST =
//       AppLocalMessagesStringsManager().badRequestError; // failure, API rejected request
//   static  String UNAUTORISED =
//       AppLocalMessagesStringsManager().unauthorizedError; // failure, user is not authorised
//   static  String FORBIDDEN =
//       AppLocalMessagesStringsManager().forbiddenError; //  failure, API rejected request
//   static  String INTERNAL_SERVER_ERROR =
//       AppLocalMessagesStringsManager().internalServerError; // failure, crash in server side
//   static  String NOT_FOUND =
//       AppLocalMessagesStringsManager().notFoundError; // failure, crash in server side
//
//   // local status code
//   static  String CONNECT_TIMEOUT = AppLocalMessagesStringsManager().timeoutError;
//   static  String CANCEL = AppLocalMessagesStringsManager().defaultError;
//   static  String RECIEVE_TIMEOUT = AppLocalMessagesStringsManager().timeoutError;
//   static  String SEND_TIMEOUT = AppLocalMessagesStringsManager().timeoutError;
//   static  String CACHE_ERROR = AppLocalMessagesStringsManager().cacheError;
//   static  String NO_INTERNET_CONNECTION = AppLocalMessagesStringsManager().noInternetError;
//   static  String DEFAULT = AppLocalMessagesStringsManager().defaultError;
//   static String REDIRECT = AppLocalMessagesStringsManager().redirectError;
// }
//
// class ApiInternalStatus {
//   static const int SUCCESS = 0;
//   static const int FAILURE = 1;
// }
