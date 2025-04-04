import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:http/http.dart' as http;

class HandleResponse {
  // دالة لتسجيل الأخطاء في مكان واحد
  static void logError(String status, String error, {String? url}) {
    log('===================== $status ====================');
    log('============== Error: $error');
    if (url == null) {
      return;
    }
    log('=====================Page => $url ====================');
  }

  static Future<Either<FailureWithMessage, T>> handleResponse<T>(
      http.Response response) async {
    var url = response.request?.url;

    try {
      var decodedBody = _decodeResponseBody(response.body);
      switch (response.statusCode) {
        case 200: // Success - OK
        case 201: // Created
          return Right(decodedBody);
        case 400: // Bad Request
          logError('Bad Request', response.body, url: url.toString());
          return Left(
              FailureWithMessage(StatusRequest.badrequest, decodedBody));
        case 403: // Unauthorized
          logError('Unauthorized', response.body, url: url.toString());
          return Left(
              FailureWithMessage(StatusRequest.unauthorized, decodedBody));
        case 402: // Payment Required
          logError('Payment Required', response.body, url: url.toString());
          return Left(
              FailureWithMessage(StatusRequest.paymentrequired, decodedBody));
        case 401: // Forbidden
          logError('Forbidden', response.body, url: url.toString());
          return Left(FailureWithMessage(StatusRequest.forbidden, decodedBody));
        case 404: // Not Found
          logError('Not Found', response.body, url: url.toString());
          return Left(FailureWithMessage(StatusRequest.notfound, decodedBody));
        case 500: // Internal Server Error
          logError('Internal Server Error', response.body, url: url.toString());
          return Left(
              FailureWithMessage(StatusRequest.servererror, decodedBody));
        case 501: // Not Implemented
          logError('Not Implemented', response.body, url: url.toString());
          return Left(
              FailureWithMessage(StatusRequest.notimplemented, decodedBody));
        case 502: // Bad Gateway
          logError('Bad Gateway', response.body, url: url.toString());
          return Left(
              FailureWithMessage(StatusRequest.badgateway, decodedBody));
        case 503: // Service Unavailable
          logError('Service Unavailable', response.body, url: url.toString());
          return Left(FailureWithMessage(
              StatusRequest.serviceunavailable, decodedBody));
        default:
          logError('Unknown Error', response.body, url: url.toString());
          return Left(
              FailureWithMessage(StatusRequest.serverfailure, decodedBody));
      }
    } catch (e) {
      logError('Error while handling response', e.toString(),
          url: url.toString());
      return Left(FailureWithMessage(StatusRequest.failure,
          "Error in decoding response body page=> ${url.toString()}"));
    }
  }

  static dynamic _decodeResponseBody(String body) {
    try {
      return jsonDecode(body);
    } catch (e) {
      logError('Error while decoding response body', e.toString());
      return {"error": "Unable to decode response body"};
    }
  }
}
