import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_app/generated/l10n.dart';
import 'package:nasa_app/services/models/mars_photo.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/mars_photos/i_mars_photos_wm.dart';
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
        wrapper: materialAppWrapper(localizations: [S.delegate]),
      );
      await multiScreenGolden(tester, 'select_mars_photos_widget_data');
    },
  );
}

class MarsPhotosWMMock extends Mock implements IMarsPhotosWM {}

final _marsPhotoMock = [
  MarsPhoto(
    imageSource: 'some url',
  ),
];
