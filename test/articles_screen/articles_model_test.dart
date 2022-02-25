import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_app/services/articles_service.dart';
import 'package:nasa_app/services/models/article.dart';
import 'package:nasa_app/ui/articles_screen/articles_model.dart';

void main() {
  final articlesServiceMock = ArticlesServiceMock();
  late ArticlesModel model;

  setUp(() {
    model = ArticlesModel(articlesServiceMock);
  });

  test('init with empty list', () async {
    when(articlesServiceMock.getArticles).thenAnswer(
          (_) => Future.value([]),
    );
    expect(model.articles.value, isEmpty);
  });

  test('getArticles return empty list', () async {
    when(articlesServiceMock.getArticles).thenAnswer(
          (_) => Future.value([]),
    );
    await model.getArticles();
    expect(model.articles.value, isEmpty);
  });

  test('getArticles return articles list', () async {
    when(articlesServiceMock.getArticles).thenAnswer(
          (_) => Future.value(_articleMock),
    );
    await model.getArticles();
    expect(model.articles.value, same(_articleMock));
  });
}

class ArticlesServiceMock extends Mock implements ArticlesService {}

final _articleMock = [
  Article(
    title: 'Article',
    imageUrl: 'some_url',
    publishedAt: '2022_02_22',
    sourceUrl: 'some_url',
  ),
];
