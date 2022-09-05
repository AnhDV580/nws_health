import 'package:dio/dio.dart';

class DioProvider {
  static Dio instance() {
    final dio = Dio();

//    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(HttpLogInterceptor());

    return dio;
  }
}

class HttpLogInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
//    LocalPref pref = LocalPref();
//    String token = await pref.getString(TOKEN);
    String token = "Todo";
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    print("onRequest: ${options.uri}\n"
        "data=${options.data}\n"
        "method=${options.method}\n"
        "headers=${options.headers}\n"
        "queryParameters=${options.queryParameters}");
    return options;
  }

  @override
  Future onResponse(Response response) {
    print("onResponse: $response");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print("onError: $err\n"
        "Response: ${err.response}");
    return super.onError(err);
  }
}
