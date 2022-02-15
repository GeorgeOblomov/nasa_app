import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/services/mars_photo_service.dart';
import 'package:nasa_app/services/models/mars_photo.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/mars_photos/mars_photos_model.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/mars_photos/mars_photos_wm.dart';

abstract class IMarsPhotosWM implements IWidgetModel {
  ValueListenable<List<MarsPhoto>> get marsPhotos;
}

MarsPhotosWM createMarsPhotosWM(BuildContext _) => MarsPhotosWM(
  MarsPhotosModel(
    MarsPhotoService(),
  ),
);