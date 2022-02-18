import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/services/mars_photo_service.dart';
import 'package:nasa_app/services/models/mars_photo.dart';

class MarsPhotosModel extends ElementaryModel {
  final ValueNotifier<List<MarsPhoto>> marsPhotos = ValueNotifier([]);

  final MarsPhotoService? _marsPhotoService;

  MarsPhotosModel(this._marsPhotoService);

  Future<void> getMarsPhotos() async {
    final value = await _marsPhotoService?.getMarsPhotos() ?? [];
    marsPhotos.value = value;
  }
}