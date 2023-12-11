import 'package:dio/dio.dart';
import 'package:shopping_app/core/utils/constants.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(
      {required String endPoint, required Map<String, dynamic>? data}) {
    return dio.get(Constants.BaseURL + endPoint, queryParameters: data);
  }

  Future<Response> postData(
      {required String endPoint,
      required Map<String, dynamic> body,
      String? token}) {
    return dio.post(Constants.BaseURL + endPoint, data: body);
  }
}
