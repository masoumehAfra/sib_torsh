import 'package:dio/dio.dart';
import 'api_path.dart';

class ApiProvider {
  Dio? _dio;

  static BaseOptions options = BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: const Duration(seconds: 30),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  Dio get httpClient{
    _dio = Dio(options);
    return _dio!;
  }

}

