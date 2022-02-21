import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_app/db/sqflite_database_manager.dart';
import 'package:nasa_app/ui/nasa_favorite_screen/nasa_favorite_model.dart';

void main() {
  final dbManagerMock = SqfliteDatabaseManagerMock();
  late NasaFavoriteModel model;

  setUp(() {
    model = NasaFavoriteModel(dbManagerMock);
  });

  test('get empty favorite list', () async {
    when(dbManagerMock.getFavorites).thenAnswer(
          (_) => Future.value([]),
    );
    expect(model.favoritePhotos.value, isEmpty);
  });

  test('getFavorites return empty list', () async {
    when(dbManagerMock.getFavorites).thenAnswer(
          (_) => Future.value([]),
    );
    await model.getFavorites();
    expect(model.favoritePhotos.value, isEmpty);
  });

  test('getFavorites return photos list', () async {
    when(dbManagerMock.getFavorites).thenAnswer(
          (_) => Future.value(_urlMock),
    );
    await model.getFavorites();
    expect(model.favoritePhotos.value, same(_urlMock));
  });
}

class SqfliteDatabaseManagerMock extends Mock implements SqfliteDatabaseManager {}

final _urlMock = [
  'some_url',
];
