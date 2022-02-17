abstract class IDatabaseManager {
  Future initDatabase();

  Future getFavorites();

  Future addToFavorite(String url);

  Future removeFromFavorite(String url);
}