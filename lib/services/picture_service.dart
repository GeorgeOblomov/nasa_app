import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nasa_app/services/models/picture.dart';
import 'package:nasa_app/utils/const.dart';


class PictureService {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<Picture> getPictureOfTheDay() async {
    final pictureResponse = await dio.get<String>(
      '/planetary/apod?api_key=$apiKey',
    );
    final bodyJson =
    jsonDecode(pictureResponse.data ?? '') as Map<String, dynamic>;

    return Picture.fromJson(bodyJson);
  }
}