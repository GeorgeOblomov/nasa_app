import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/extensions/localization_extension.dart';
import 'package:nasa_app/ui/nasa_image_screen/i_image_screen_wm.dart';
import 'package:nasa_app/ui/nasa_image_screen/nasa_image_model.dart';
import 'package:nasa_app/ui/nasa_image_screen/nasa_image_screen.dart';
import 'package:nasa_app/ui/nasa_image_screen/widgets/save_image_dialog.dart';

class NasaImageWM extends WidgetModel<NasaImageScreen, NasaImageModel>
    implements IImageScreenWM {

  @override
  String get imageScreenTitle => context.localizations.imageScreenTitle;

  @override
  String get favoriteButtonTitle => context.localizations.addToFavorite;

  @override
  String get saveButtonTitle => context.localizations.save;

  @override
  Color get photoViewBackground => Theme.of(context).canvasColor;

  NasaImageWM(NasaImageModel model) : super(model);

  @override
  void saveImageToGallery(String url) {
    model.saveImageToGallery(url).then((isSuccess) {
      return showDialog<bool>(
        context: context,
        builder: (context) {
          return SaveImageDialog(
            content: isSuccess ?? false
                ? context.localizations.saveDialogContent
                : context.localizations.errorText,
          );
        },
      );
    });
  }

  @override
  void onBackTap() => Navigator.pop(context);
}