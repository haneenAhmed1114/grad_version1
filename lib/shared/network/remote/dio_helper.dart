import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static String? token;  // نخزن التوكين هنا

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://graduation.al-embrator.com/',
        receiveDataWhenStatusError: true,
      ),
    );

    dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('REQUEST[${options.method}] => PATH: ${options.path}');
        print('Headers: ${options.headers}');
        print('Data: ${options.data}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        print('ERROR[${e.response?.statusCode}] => MESSAGE: ${e.message}');
        return handler.next(e);
      },
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': 'Bearer ${token ?? DioHelper.token}',
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
    };

    // أرسل Authorization فقط إذا كان التوكن موجود (يعني بعد تسجيل الدخول)
    if (token != null || DioHelper.token != null) {
      dio!.options.headers['Authorization'] =
      token != null ? 'Bearer $token' : 'Bearer ${DioHelper.token}';
    }

    return dio!.post(url, queryParameters: query, data: data);
  }
}


