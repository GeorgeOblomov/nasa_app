import 'dart:math';

import 'package:intl/intl.dart';
import 'package:nasa_app/services/http_clients/i_http_client.dart';
import 'package:nasa_app/services/models/picture.dart';
import 'package:nasa_app/utils/const.dart';

class PictureService {
  final IHttpClient httpClient;

  PictureService(this.httpClient);

  Future<Picture> getPictureOfTheDay() async {
    final pictureResponseBody = await httpClient.get(
      '/planetary/apod?api_key=$apiKey',
    );

    return Picture.fromJson(pictureResponseBody);
  }

  Future<Picture> updatePicture() async {
    final pictureResponseBody = await httpClient.get(
      '/planetary/apod?api_key=$apiKey&date=${_formatRandomDate()}',
    );

    return Picture.fromJson(pictureResponseBody);
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
