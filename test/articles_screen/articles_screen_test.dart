import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_app/generated/l10n.dart';
import 'package:nasa_app/services/models/article.dart';
import 'package:nasa_app/ui/articles_screen/articles_screen.dart';
import 'package:nasa_app/ui/articles_screen/i_articles_wm.dart';

void main() {
  final articlesWM = ArticlesWM();

  setUp(() {
    when(() => articlesWM.articles).thenAnswer(
          (_) => ValueNotifier<List<Article>>([]),
    );
  });

  testGoldens(
    'select articles screen with data golden test',
        (tester) async {
      when(() => articlesWM.articles).thenAnswer(
            (_) => ValueNotifier<List<Article>>(_articleMock),
      );
      when(() => articlesWM.articlesScreenTitle).thenAnswer((_) => 'Articles');

      await tester.pumpWidgetBuilder(
        const ArticlesScreen(isTest: true).build(articlesWM),
        wrapper: materialAppWrapper(localizations: [S.delegate]),
      );
      await multiScreenGolden(tester, 'select_articles_screen_data');
    },
  );
}

class ArticlesWM extends Mock implements IArticlesWM {}

final _articleMock = [
  Article(
    title: 'Article',
    imageUrl: 'some url',
    publishedAt: '2021.02.22',
    sourceUrl: 'some url',
  ),
];
