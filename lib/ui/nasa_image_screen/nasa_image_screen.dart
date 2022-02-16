import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/ui/nasa_image_screen/i_image_screen_wm.dart';
import 'package:nasa_app/ui/widgets/button_widget.dart';
import 'package:nasa_app/utils/app_colors.dart';
import 'package:photo_view/photo_view.dart';

class NasaImageScreen extends ElementaryWidget<IImageScreenWM> {
  final String url;

  const NasaImageScreen({
    required this.url,
    WidgetModelFactory wmFactory = createNasaImageWM,
    Key? key,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IImageScreenWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wm.imageScreenTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: wm.onBackTap,
        ),
        backgroundColor: appBarBackground,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PhotoView(
                imageProvider: NetworkImage(url),
                heroAttributes: PhotoViewHeroAttributes(
                  tag: url,
                ),
                backgroundDecoration:
                    BoxDecoration(color: wm.photoViewBackground),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  title: wm.favoriteButtonTitle,
                  onTap: () {},
                ),
                ButtonWidget(
                  title: wm.saveButtonTitle,
                  onTap: () => wm.saveImageToGallery(url),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
