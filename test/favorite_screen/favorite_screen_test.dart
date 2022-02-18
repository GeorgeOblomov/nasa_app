import 'package:flutter/foundation.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_app/generated/l10n.dart';
import 'package:nasa_app/ui/nasa_favorite_screen/i_favorite_screen_wm.dart';
import 'package:nasa_app/ui/nasa_favorite_screen/nasa_favorite_screen.dart';

void main() {
  final favoriteScreenWM = FavoriteScreenWMMock();

  testGoldens(
    'select favorite screen widget with data golden test',
        (tester) async {
      when(() => favoriteScreenWM.favoritePhotos).thenAnswer(
            (_) => ValueNotifier<List<String>>(_urlMock),
      );

      when(() => favoriteScreenWM.favoriteTitle).thenAnswer((_) => 'test');
      when(() => favoriteScreenWM.favoriteEmptyText).thenAnswer((_) => 'test');

      await tester.pumpWidgetBuilder(
        const NasaFavoriteScreen(isTest: true).build(favoriteScreenWM),
        wrapper: materialAppWrapper(localizations: [S.delegate]),
      );
      await multiScreenGolden(tester, 'select_favorite_screen_data');
    },
  );
}

class FavoriteScreenWMMock extends Mock implements IFavoriteScreenWM {}

final _urlMock = [
  'some_url',
];
