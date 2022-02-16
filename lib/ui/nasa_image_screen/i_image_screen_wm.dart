import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/ui/nasa_image_screen/nasa_image_model.dart';
import 'package:nasa_app/ui/nasa_image_screen/nasa_image_wm.dart';

abstract class IImageScreenWM implements IWidgetModel {
  String get imageScreenTitle;
  String get favoriteButtonTitle;
  String get saveButtonTitle;

  Color get photoViewBackground;

  void saveImageToGallery(String url);

  void onBackTap();
}

NasaImageWM createNasaImageWM(BuildContext _) {
  return NasaImageWM(NasaImageModel());
}