// core/network/dio_helper.dart
import 'package:dio/dio.dart';
import 'package:shoppy/core/constants/api_endpoints.dart';

class DioHelper {
  final Dio dio;

  DioHelper(this.dio){
    dio.options.baseUrl = ApiEndpoints.baseUrl;
    dio.options.headers = {
      'Content-Type': 'application/json'
    };
  }

  Future<Response> get(String url, {Map<String, dynamic>? query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
