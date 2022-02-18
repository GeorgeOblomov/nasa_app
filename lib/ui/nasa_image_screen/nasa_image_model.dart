import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class NasaImageModel extends ElementaryModel {
  ValueNotifier<bool> isSavingProcess = ValueNotifier(false);

  Future<bool?> saveImageToGallery(String url) {
    return GallerySaver.saveImage(url);
  }
}