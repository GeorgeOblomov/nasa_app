import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:nasa_app/db/i_database_manager.dart';

class NasaImageModel extends ElementaryModel {
  final IDatabaseManager _databaseManager;

  ValueNotifier<bool> isSavingProcess = ValueNotifier(false);

  NasaImageModel(this._databaseManager);

  Future<bool?> saveImageToGallery(String url) {
    return GallerySaver.saveImage(url);
  }

  Future addToFavorite(String url) {
    return _databaseManager.addToFavorite(url);
  }
}