import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nasa_app/services/models/mars_photo.dart';
import 'package:nasa_app/utils/const.dart';

class MarsPhotoService {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<List<MarsPhoto>> getMarsPhotos() async {
    final response = await dio.get<String>(
      '/mars-photos/api/v1/rovers/curiosity/photos?sol=100&api_key=$apiKey',
    );
    final bodyJson =
        jsonDecode(response.data ?? '') as Map<String, dynamic>;

    final result = <MarsPhoto>[];

    for (final photo in bodyJson['photos'] as List) {
      result.add(MarsPhoto.fromJson(photo as Map<String, dynamic>));
    }

    return result;
  }
}
