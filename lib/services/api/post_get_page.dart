import 'dart:convert';
import 'dart:developer';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/services/api/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app/services/api/handle_response.dart';
import 'package:http/http.dart' as http;

class PostGetPage {
  Future<Either<FailureWithMessage, Map<String, dynamic>>> postImages(
      {required String url, required String path}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(ApiServices.headers);
      request.files.add(await http.MultipartFile.fromPath('image', path));
      http.StreamedResponse response =
          await request.send().timeout(const Duration(seconds: 60));
      var resBody = await response.stream.bytesToString();
      http.Response res = http.Response(resBody, response.statusCode,
          request: response.request);
      return await HandleResponse.handleResponse<Map<String, dynamic>>(res);
    } catch (e) {
      HandleResponse.logError('postImages', e.toString(), url: url);
      return Left(FailureWithMessage(
          StatusRequest.failure, "(Error in uploading image) Page =>$url"));
    }
  }

  Future<Either<FailureWithMessage, Map<String, dynamic>>> getDataMap(
      {required String url, String page = ""}) async {
    try {
      var res =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 60));
      return await HandleResponse.handleResponse<Map<String, dynamic>>(res);
    } catch (e) {
      HandleResponse.logError(url, e.toString(), url: url);
      return Left(FailureWithMessage(
          StatusRequest.failure, "(Error in getting data)  Page =>$url"));
    }
  }

  // دالة لإرسال البيانات
  Future<Either<FailureWithMessage, T>> postDataMap<T>({
    required String url,
    Map<String, dynamic> data = const {},
    Map<String, String> header = const {},
    String page = "",
  }) async {
    // log("*******************${jsonEncode(data)}");
    try {
      var res = await http
          .post(
            Uri.parse(url),
            headers: {...ApiServices.headers, ...header},
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 60));
      return await HandleResponse.handleResponse<T>(res);
    } catch (e) {
      HandleResponse.logError(url, e.toString(), url: url);
      return Left(FailureWithMessage(StatusRequest.offlinefailure,
          "(Error in sending data)  Page =>$url"));
    }
  }

  Future<Either<FailureWithMessage, T>> putDataMap<T>({
    required String url,
    Map<String, dynamic> data = const {},
    Map<String, String> header = const {},
    String page = "",
  }) async {
    try {
      var res = await http
          .put(
            Uri.parse(url),
            headers: {...ApiServices.headers, ...header},
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 60));
      return await HandleResponse.handleResponse<T>(res);
    } catch (e) {
      HandleResponse.logError(url, e.toString(), url: url);
      return Left(FailureWithMessage(StatusRequest.offlinefailure,
          "(Error in sending data)  Page =>$url"));
    }
  }

  Future<Either<FailureWithMessage, T>> dynamicData<T>({
    required String url,
    Map<String, String> header = const {},
    Map<String, String> data = const {},
    String page = "",
    String methode = "POST",
  }) async {
    try {
      // log("*****************************${{...ApiServices.headers, ...header}}");
      var req = http.MultipartRequest(methode, Uri.parse(url));
      req.headers.addAll({...ApiServices.headers, ...header});
      req.fields.addAll(data);
      var res = await req.send().timeout(const Duration(seconds: 60));
      final resBody = await res.stream.bytesToString();
      http.Response response =
          http.Response(resBody, res.statusCode, request: res.request);
      return await HandleResponse.handleResponse<T>(response);
    } catch (e) {
      HandleResponse.logError(url, e.toString(), url: url);
      return Left(FailureWithMessage(StatusRequest.offlinefailure,
          "(Error in dynamic data)  Page =>$url"));
    }
  }

  Future<Either<StatusRequest, String>> getDataAsString(String link) async {
    try {
      var res = await http.get(Uri.parse(link), headers: ApiServices.headers);
      // log(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        var resBody = res.body;
        return Right(resBody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      log('Error $e');
      return const Left(StatusRequest.serverfailure);
    }
  }
}
