import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nasa_app/services/http_clients/i_http_client.dart';
import 'package:nasa_app/utils/const.dart';

class DioHttpClient implements IHttpClient {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  Future<Map<String, dynamic>> get(String url) async {
    final response = await dio.get<String>(url);

    return jsonDecode(response.data ?? '') as Map<String, dynamic>;
  }
}