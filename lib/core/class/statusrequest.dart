import 'package:flutter/material.dart';

enum StatusRequest {
  none, // حالة مبدئية أو فارغة
  loading, // حالة تحميل
  success, // نجاح العملية
  failure, // فشل العملية بشكل عام
  serverfailure, // فشل الخادم (مثل 500 أو 502)
  serverException, // استثناء في الخادم (مثل خطأ غير متوقع)
  offlinefailure, // فشل بسبب عدم الاتصال بالإنترنت
  badrequest, // طلب غير صالح (400)
  unauthorized, // غير مصرح (401)
  paymentrequired, // يتطلب الدفع (402)
  forbidden, // محظور (403)
  notfound, // غير موجود (404)
  servererror, // خطأ داخلي في الخادم (500)
  notimplemented, // غير مدعوم (501)
  badgateway, // بوابة سيئة (502)
  serviceunavailable, // الخدمة غير متاحة (503)
}

extension StatusRequestExtension on StatusRequest {
  String get text {
    switch (this) {
      case StatusRequest.none:
        return "No status";
      case StatusRequest.loading:
        return "Loading...";
      case StatusRequest.success:
        return "Success";
      case StatusRequest.failure:
        return "Operation failed";
      case StatusRequest.serverfailure:
        return "Server failure";
      case StatusRequest.serverException:
        return "Server exception";
      case StatusRequest.offlinefailure:
        return "No internet connection";
      case StatusRequest.badrequest:
        return "Bad request (400)";
      case StatusRequest.unauthorized:
        return "Unauthorized (401)";
      case StatusRequest.paymentrequired:
        return "Payment required (402)";
      case StatusRequest.forbidden:
        return "Forbidden (403)";
      case StatusRequest.notfound:
        return "Not found (404)";
      case StatusRequest.servererror:
        return "Server error (500)";
      case StatusRequest.notimplemented:
        return "Not implemented (501)";
      case StatusRequest.badgateway:
        return "Bad gateway (502)";
      case StatusRequest.serviceunavailable:
        return "Service unavailable (503)";
      default:
        return "Unknown status";
    }
  }

  IconData get icon {
    switch (this) {
      case StatusRequest.none:
        return Icons.info_outline; // أيقونة معلومات
      case StatusRequest.loading:
        return Icons.hourglass_top; // أيقونة تحميل
      case StatusRequest.success:
        return Icons.check_circle_outline; // أيقونة نجاح
      case StatusRequest.failure:
        return Icons.error_outline; // أيقونة خطأ عام
      case StatusRequest.serverfailure:
        return Icons.cloud_off; // أيقونة فشل الخادم
      case StatusRequest.serverException:
        return Icons.warning_amber; // أيقونة تحذير
      case StatusRequest.offlinefailure:
        return Icons.signal_wifi_off; // أيقونة عدم اتصال بالإنترنت
      case StatusRequest.badrequest:
        return Icons.report_problem; // أيقونة مشكلة
      case StatusRequest.unauthorized:
        return Icons.lock_outline; // أيقونة غير مصرح
      case StatusRequest.paymentrequired:
        return Icons.payment; // أيقونة دفع
      case StatusRequest.forbidden:
        return Icons.block; // أيقونة محظور
      case StatusRequest.notfound:
        return Icons.search_off; // أيقونة غير موجود
      case StatusRequest.servererror:
        return Icons.dangerous; // أيقونة خطأ داخلي
      case StatusRequest.notimplemented:
        return Icons.build; // أيقونة غير مدعوم
      case StatusRequest.badgateway:
        return Icons.cloud_off; // أيقونة بوابة سيئة
      case StatusRequest.serviceunavailable:
        return Icons.cloud_off; // أيقونة خدمة غير متاحة
      default:
        return Icons.error_outline; // أيقونة خطأ افتراضية
    }
  }
}

class FailureWithMessage {
  final StatusRequest status;
  final dynamic message;

  FailureWithMessage(this.status, this.message);
}
