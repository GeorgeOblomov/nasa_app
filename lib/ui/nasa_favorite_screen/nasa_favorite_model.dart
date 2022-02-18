import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/db/i_database_manager.dart';

class NasaFavoriteModel extends ElementaryModel {
  final ValueNotifier<List<String>> favoritePhotos = ValueNotifier([]);

  final IDatabaseManager? _databaseManager;

  NasaFavoriteModel(this._databaseManager);

  Future<void> getFavorites() async {
    final favorites = await _databaseManager?.getFavorites() ?? [];

    favoritePhotos.value = favorites;
  }
}