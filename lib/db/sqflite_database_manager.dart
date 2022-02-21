import 'package:nasa_app/db/i_database_manager.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDatabaseManager implements IDatabaseManager {
  late final Database _database;

  @override
  Future initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'favorite.db');

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('CREATE TABLE favorite '
          '(favorite_id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'picture_url TEXT);');
    }).then<Database>((database) => _database = database);
  }

  @override
  Future<void> addToFavorite(String url) {
    return _database.execute('INSERT INTO favorite (picture_url) '
        "VALUES ('$url')");
  }

  @override
  Future<void> removeFromFavorite(String url) {
    return _database.execute('DELETE FROM favorite '
        "WHERE picture_url = '$url'");
  }

  @override
  Future<List<String>> getFavorites() async {
    final urlList = <String>[];

    final rawList = await _database.rawQuery('SELECT * '
        'FROM favorite');

    if (rawList.isNotEmpty) {
      urlList.addAll(
        rawList.map((raw) {
          return raw['picture_url'] as String;
        }).toList(),
      );
    }

    return urlList;
  }
}
