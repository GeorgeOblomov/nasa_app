abstract class IDatabaseManager {
  Future initDatabase();

  Future<List<String>> getFavorites();

  Future addToFavorite(String url);

  Future removeFromFavorite(String url);
}