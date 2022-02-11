import 'package:flutter/foundation.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_app/services/models/picture.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/picture_of_the_day/i_picture_of_the_day_model.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/picture_of_the_day/picture_of_the_day_widget.dart';

void main() {
  final pictureOfTheDayWM = PictureOfTheDayWMMock();

  testGoldens('select  picture of the day widget with data golden test', (
      tester,) async {
    when(() => pictureOfTheDayWM.picture).thenAnswer(
          (_) => ValueNotifier<Picture>(_pictureMock),
    );

    await tester.pumpWidgetBuilder(
      const PictureOfTheDayWidget(isTest: true).build(pictureOfTheDayWM),
    );
    await screenMatchesGolden(tester, 'select_mars_photos_widget_data');
  });
}

class PictureOfTheDayWMMock extends Mock implements IPictureOfTheDayWM {}

final _pictureMock = Picture(
  hdUrl: 'some url',
  title: 'some picture',
);