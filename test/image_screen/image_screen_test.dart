import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_app/generated/l10n.dart';
import 'package:nasa_app/ui/nasa_image_screen/i_image_screen_wm.dart';
import 'package:nasa_app/ui/nasa_image_screen/nasa_image_screen.dart';

void main() {
  final nasaImageScreenWM = NasaImageScreenWMMock();

  testGoldens('nasa image screen saving process', (
    tester,
  ) async {
    when(() => nasaImageScreenWM.favoriteButtonTitle).thenAnswer((_) => 'test');
    when(() => nasaImageScreenWM.saveButtonTitle).thenAnswer((_) => 'test');
    when(() => nasaImageScreenWM.imageScreenTitle).thenAnswer((_) => 'test');

    when(() => nasaImageScreenWM.isSavingProcess)
        .thenAnswer((_) => ValueNotifier(false));
    when(() => nasaImageScreenWM.isFavorite)
        .thenAnswer((_) => ValueNotifier(false));

    when(() => nasaImageScreenWM.photoViewBackground).thenAnswer((_) => Colors.transparent);

    await tester.pumpWidgetBuilder(
      const NasaImageScreen(
        url: 'https://apod.nasa.gov/apod/image/2202/ThreeClustersPuppis1024.jpg',
        isTest: true,
      ).build(nasaImageScreenWM),
      wrapper: materialAppWrapper(localizations: [S.delegate]),
    );
    await multiScreenGolden(tester, 'nasa_image_screen_saving_process');
  });
}

class NasaImageScreenWMMock extends Mock implements IImageScreenWM {}
