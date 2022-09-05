import 'dart:convert';

import 'package:dio/dio.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    final method = options?.method;
    final uri = options?.uri;
    final data = options?.data;
    // logger.logLongMessage("✈️ REQUEST2[$method] => PATH: ${options?.headers}");
    if (method == 'GET') {
      // logger.logLongMessage("✈️ REQUEST[$method] => PATH: $uri");
    } else {
      try {
        final encodedData = jsonEncode(data);
        // logger.logLongMessage("✈️ REQUEST[$method] => PATH: $uri \n DATA: $encodedData");
      } catch (e) {
        // logger.logLongMessage("✈️ REQUEST[$method] => PATH: $uri");
      }
    }
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    final statusCode = response?.statusCode;
    final uri = response?.request?.uri;
    final data = jsonEncode(response?.data);
    // logger.logLongMessage("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");
    //Handle section expired
    final responseData = response?.data;
    if (responseData is Map<String, dynamic>) {
      final returnCode = responseData['returnCode'];
      if (returnCode is String) {
        // if (returnCode == ApiReturnCode.ILLEGAL_ACCESS_TOKEN.stringCode) {
        //   GlobalEvent.instance.onTokenExpired.add(true);
        // }
      }
    }
    //Hotfix
    if (responseData is String) {
      response?.data = jsonDecode(responseData);
    }
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    final statusCode = err?.response?.statusCode;
    final uri = err?.request?.uri;
    // logger.logLongMessage("⚠️ ERROR[$statusCode] => PATH: $uri");
    return super.onError(err);
  }
}
