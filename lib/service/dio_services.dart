import 'package:dio/dio.dart';

class DioServices {
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: "https://api.itbook.store/1.0/",
        connectTimeout: 10000,
        receiveTimeout: 9000),
  );
}
