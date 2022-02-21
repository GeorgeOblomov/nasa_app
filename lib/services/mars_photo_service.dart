import 'package:nasa_app/services/http_clients/i_http_client.dart';
import 'package:nasa_app/services/models/mars_photo.dart';
import 'package:nasa_app/utils/const.dart';

class MarsPhotoService {
  final IHttpClient httpClient;

  MarsPhotoService(this.httpClient);

  Future<List<MarsPhoto>> getMarsPhotos() async {
    final responseBody = await httpClient.get(
      '$nasaBaseUrl/mars-photos/api/v1/rovers/curiosity/photos?sol=100&api_key=$nasaApiKey',
    );

    final result = <MarsPhoto>[];

    for (final photo in responseBody['photos'] as List) {
      result.add(MarsPhoto.fromJson(photo as Map<String, dynamic>));
    }

    return result;
  }
}
