import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/extensions/localization_extension.dart';
import 'package:nasa_app/ui/nasa_image_screen/i_image_screen_wm.dart';
import 'package:nasa_app/ui/nasa_image_screen/nasa_image_model.dart';
import 'package:nasa_app/ui/nasa_image_screen/nasa_image_screen.dart';
import 'package:nasa_app/ui/nasa_image_screen/widgets/save_image_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

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

  @override
  ValueListenable<bool> get isSavingProcess => model.isSavingProcess;

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
                  ? context.localizations.saveDialogContent
                  : context.localizations.errorText,
            );
          },
        );

      model.isSavingProcess.value = false;
  }

  @override
  void onBackTap() => Navigator.pop(context);
}