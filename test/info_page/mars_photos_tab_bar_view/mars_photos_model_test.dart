import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_app/services/mars_photo_service.dart';
import 'package:nasa_app/services/models/mars_photo.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/mars_photos/mars_photos_model.dart';

void main() {
  final marsServiceMock = MarsServiceMock();
  late MarsPhotosModel model;

  setUp(() {
    model = MarsPhotosModel(marsServiceMock);
  });

  test('init with empty list', () async {
    when(marsServiceMock.getMarsPhotos).thenAnswer(
          (_) => Future.value([]),
    );
    expect(model.marsPhotos.value, isEmpty);
  });

  test('getMarsPhotos return empty list', () async {
    when(marsServiceMock.getMarsPhotos).thenAnswer(
          (_) => Future.value([]),
    );
    await model.getMarsPhotos();
    expect(model.marsPhotos.value, isEmpty);
  });

  test('getMarsPhotos return photos list', () async {
    when(marsServiceMock.getMarsPhotos).thenAnswer(
          (_) => Future.value(_marsPhotoMock),
    );
    await model.getMarsPhotos();
    expect(model.marsPhotos.value, same(_marsPhotoMock));
  });
}

class MarsServiceMock extends Mock implements MarsPhotoService {}

final _marsPhotoMock = [
  MarsPhoto(
    imageSource: 'some url',
  ),
];
