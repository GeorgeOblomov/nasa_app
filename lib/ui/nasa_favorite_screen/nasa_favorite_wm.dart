import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:nasa_app/extensions/localization_extension.dart';
import 'package:nasa_app/ui/nasa_favorite_screen/i_favorite_screen_wm.dart';
import 'package:nasa_app/ui/nasa_favorite_screen/nasa_favorite_model.dart';
import 'package:nasa_app/ui/nasa_favorite_screen/nasa_favorite_screen.dart';

class NasaFavoriteWM extends WidgetModel<NasaFavoriteScreen, NasaFavoriteModel>
    implements IFavoriteScreenWM {


  @override
  String get favoriteTitle => context.localizations.favoriteTitle;

  @override
  ValueListenable<List<String>> get favoritePhotos => model.favoritePhotos;

  NasaFavoriteWM(NasaFavoriteModel model) : super(model);

  @override
  Future getFavorites() {
    return model.getFavorites();
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.getFavorites();
  }
}
