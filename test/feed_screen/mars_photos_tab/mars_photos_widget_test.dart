import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_app/services/models/mars_photo.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/mars_photos/i_mars_photos_model.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/mars_photos/mars_photos_widget.dart';

void main() {
  final marsPhotosWM = MarsPhotosWMMock();

  setUp(() {
    when(() => marsPhotosWM.marsPhotos).thenAnswer(
      (_) => ValueNotifier<List<MarsPhoto>>([]),
    );
  });

  testGoldens(
    'select  mars photos widget with data golden test',
    (tester) async {
      when(() => marsPhotosWM.marsPhotos).thenAnswer(
        (_) => ValueNotifier<List<MarsPhoto>>(_marsPhotoMock),
      );

      await tester.pumpWidgetBuilder(
        const MarsPhotosWidget(isTest: true).build(marsPhotosWM),
      );
      await screenMatchesGolden(tester, 'select_mars_photos_widget_data');
    },
  );
}

class MarsPhotosWMMock extends Mock implements IMarsPhotosModel {}

final _marsPhotoMock = [
  MarsPhoto(
    imageSource: 'some url',
  ),
];
