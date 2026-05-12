import 'package:dio/dio.dart';

import 'network_service_response.dart';

/// Thrown on unhandled API exceptions
class ApiResponseException implements Exception {
  String? exceptionMessage;
  dynamic data;

  ApiResponseException({this.exceptionMessage, this.data});

  @override
  String toString() => '{exceptionMessage: $exceptionMessage, data: $data}';
}

class NetworkConnectivityException implements Exception {
  String? exceptionMessage = "No internet connectivity";
  NetworkConnectivityException({this.exceptionMessage});

  @override
  String toString() => '{exception: $exceptionMessage}';
}


NetworkServiceResponse handleException(DioException e, StackTrace trace) {
  if (e.response != null) {
    // Safely extract the message from the response data
    String? errorMessage;
    final dynamic data = e.response?.data;

    if (data is Map) {
      errorMessage = data["message"]?.toString();
    } else if (data is String) {
      errorMessage = data;
    }

    if (errorMessage != null) {
      print("Network Error Message: $errorMessage");
    }

    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    dynamic errorData = {"error": e};
    if (e.response!.statusCode! >= 500) {
      return NetworkServiceResponse(
        result: NetworkResult.SERVER_ERROR,
        data: errorData,
        error: errorMessage ?? "Internal server error",
      );
    }
    if (e.response!.statusCode! == 401) {
      return NetworkServiceResponse(
        result: NetworkResult.UNAUTHORISED,
        data: errorData,
        error: errorMessage ?? "Unauthorized",
      );
    } else {
      return NetworkServiceResponse(
        data: errorData,
        error: errorMessage ?? "Looks like something is wrong, we are working to fix it",
      );
    }
  } else {
    // Something happened in setting up or sending the request that triggered an Error
    return NetworkServiceResponse(
      result: NetworkResult.FAILURE,
      data: {"error": e.message},
      error: e.message ?? "Connection error, please check your internet",
    );
  }
}

final errorCodes = {"ERROR_CODE": "Custom message"};
