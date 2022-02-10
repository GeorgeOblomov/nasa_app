import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
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

  Future<Picture> getRandomPicture() async {
    final pictureResponse = await dio.get<String>(
      '/planetary/apod?api_key=$apiKey&date=${_formatRandomDate()}',
    );
    final bodyJson =
        jsonDecode(pictureResponse.data ?? '') as Map<String, dynamic>;

    return Picture.fromJson(bodyJson);
  }

  String _formatRandomDate() {
    final randomDate = _getRandomDate();
    final formattedDate = DateFormat('yyyy-MM-dd').format(randomDate);

    return formattedDate;
  }

  DateTime _getRandomDate() {
    final gen = Random();
    const range = 100;

    return DateTime.now().subtract(Duration(days: gen.nextInt(range)));
  }
}
