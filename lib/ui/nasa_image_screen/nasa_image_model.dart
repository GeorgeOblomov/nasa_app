import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:nasa_app/db/i_database_manager.dart';

class NasaImageModel extends ElementaryModel {
  final IDatabaseManager _databaseManager;

  ValueNotifier<bool> isSavingProcess = ValueNotifier(false);

  ValueNotifier<bool> isFavorite = ValueNotifier(false);

  NasaImageModel(this._databaseManager);

  Future<bool?> saveImageToGallery(String url) {
    return GallerySaver.saveImage(url);
  }

  Future addToFavorite(String url) {
    return _databaseManager.addToFavorite(url);
  }

  Future removeFromFavorite(String url) {
    return _databaseManager.removeFromFavorite(url);
  }

  Future<List<String>> getFavorites() {
    return _databaseManager.getFavorites();
  }
}