import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/generated/l10n.dart';
import 'package:nasa_app/ui/nasa_image_screen/i_image_screen_wm.dart';
import 'package:nasa_app/ui/nasa_image_screen/nasa_image_model.dart';
import 'package:nasa_app/ui/nasa_image_screen/nasa_image_screen.dart';
import 'package:nasa_app/ui/nasa_image_screen/widgets/save_image_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

class NasaImageWM extends WidgetModel<NasaImageScreen, NasaImageModel>
    implements IImageScreenWM {
  @override
  String get imageScreenTitle => S.current.imageScreenTitle;

  @override
  String get favoriteButtonTitle => model.isFavorite.value
      ? S.current.removeFromFavorite
      : S.current.addToFavorite;

  @override
  String get saveButtonTitle => S.current.save;

  @override
  Color get photoViewBackground => Theme.of(context).canvasColor;

  @override
  ValueListenable<bool> get isSavingProcess => model.isSavingProcess;

  @override
  ValueListenable<bool> get isFavorite => model.isFavorite;

  NasaImageWM(NasaImageModel model) : super(model);

  @override
  Future<void> saveImageToGallery(String url) async {
    final status = await Permission.photos.status;

    if (status.isDenied) {
      await openAppSettings();
      return;
    }

    model.isSavingProcess.value = true;

    final isSuccess = await model.saveImageToGallery(url) ?? false;
    await showDialog<void>(
      context: context,
      builder: (context) {
        return SaveImageDialog(
          content: isSuccess
              ? S.current.saveDialogContent
              : S.current.errorText,
        );
      },
    );

      model.isSavingProcess.value = false;
  }

  @override
  Future<void> onFavoriteButtonTap(String url) async {
    if (model.isFavorite.value) {
      await model.removeFromFavorite(url);
      model.isFavorite.value = false;
    } else {
      await model.addToFavorite(url);
      model.isFavorite.value = true;
    }
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.getFavorites().then((favorites) {
      model.isFavorite.value = favorites.contains(widget.url);
    });
  }

  @override
  void onBackTap() => Navigator.pop(context);
}
