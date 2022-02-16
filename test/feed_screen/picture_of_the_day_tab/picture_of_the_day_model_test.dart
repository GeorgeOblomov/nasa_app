import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_app/services/models/picture.dart';
import 'package:nasa_app/services/picture_service.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/picture_of_the_day/picture_of_the_day_model.dart';


void main() {
  final pictureServiceMock = PictureServiceMock();
  late PictureOfTheDayModel model;

  setUp(() {
    model = PictureOfTheDayModel(pictureServiceMock);
  });

  test('getPictureOfTheDay return picture', () async {
    when(pictureServiceMock.getPictureOfTheDay).thenAnswer(
      (_) => Future.value(_pictureMock),
    );
    await model.getPictureOfTheDay();
    expect(model.picture.value, same(_pictureMock));
  });

  test('getRandomPicture return picture', () async {
    when(pictureServiceMock.updatePicture).thenAnswer(
          (_) => Future.value(_pictureMock),
    );
    await model.updatePicture();
    expect(model.picture.value, same(_pictureMock));
  });
}

class PictureServiceMock extends Mock implements PictureService {}

final _pictureMock = Picture(title: 'some title', hdUrl: 'some url');
