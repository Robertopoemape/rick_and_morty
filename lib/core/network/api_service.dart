import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';

import 'dio_interceptor.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  )..interceptors.addAll([
      DioInterceptor(),
      AwesomeDioInterceptor(
        logRequestTimeout: true,
      ),
    ]);

  Future<Response> getCharacters(int page) async {
    return await _dio.get('character', queryParameters: {'page': page});
  }

  Future<Response> searchCharacters(String name) async {
    return await _dio.get('character', queryParameters: {'name': name});
  }
}
