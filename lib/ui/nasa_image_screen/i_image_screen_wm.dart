import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/di/injector_widget.dart';
import 'package:nasa_app/ui/nasa_image_screen/nasa_image_model.dart';
import 'package:nasa_app/ui/nasa_image_screen/nasa_image_wm.dart';

abstract class IImageScreenWM implements IWidgetModel {
  String get imageScreenTitle;

  String get favoriteButtonTitle;

  String get saveButtonTitle;

  Color get photoViewBackground;

  ValueListenable<bool> get isSavingProcess;

  ValueListenable<bool> get isFavorite;

  void saveImageToGallery(String url);

  void onFavoriteButtonTap(String url);

  void initFavorite(String url);

  void onBackTap();
}

NasaImageWM createNasaImageWM(BuildContext context) {
  return NasaImageWM(
    NasaImageModel(InjectorWidget.of(context).databaseManager),
  );
}
