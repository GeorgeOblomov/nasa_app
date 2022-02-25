import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nasa_app/di/injector_widget.dart';
import 'package:nasa_app/ui/nasa_favorite_screen/nasa_favorite_model.dart';
import 'package:nasa_app/ui/nasa_favorite_screen/nasa_favorite_wm.dart';

abstract class IFavoriteScreenWM extends IWidgetModel {
  String get favoriteTitle;

  String get favoriteEmptyText;

  ValueListenable<List<String>> get favoritePhotos;
}

NasaFavoriteWM createNasaFavoriteWM(BuildContext context) {
  return NasaFavoriteWM(
    NasaFavoriteModel(InjectorWidget.maybeOf(context)?.databaseManager),
  );
}
