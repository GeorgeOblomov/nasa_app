import 'package:flutter/foundation.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_app/generated/l10n.dart';
import 'package:nasa_app/services/models/picture.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/picture_of_the_day/i_picture_of_the_day_wm.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/picture_of_the_day/picture_of_the_day_widget.dart';

void main() {
  final pictureOfTheDayWM = PictureOfTheDayWMMock();

  testGoldens('select  picture of the day widget with data golden test', (
    tester,
  ) async {
    when(() => pictureOfTheDayWM.picture).thenAnswer(
      (_) => ValueNotifier<Picture>(_pictureMock),
    );
    when(() => pictureOfTheDayWM.randomButtonTitle).thenAnswer((_) => 'test');

    await tester.pumpWidgetBuilder(
      const PictureOfTheDayWidget(isTest: true).build(pictureOfTheDayWM),
      wrapper: materialAppWrapper(localizations: [S.delegate]),
    );
    await multiScreenGolden(tester, 'select_mars_photos_widget_data');
  });
}

class PictureOfTheDayWMMock extends Mock implements IPictureOfTheDayWM {}

final _pictureMock = Picture(
  hdUrl: 'some url',
  title: 'some picture',
);