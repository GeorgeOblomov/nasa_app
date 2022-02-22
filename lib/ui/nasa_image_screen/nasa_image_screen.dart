import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/ui/nasa_image_screen/i_image_screen_wm.dart';
import 'package:nasa_app/ui/widgets/app_bar_widget.dart';
import 'package:nasa_app/ui/widgets/button_widget.dart';
import 'package:photo_view/photo_view.dart';

class NasaImageScreen extends ElementaryWidget<IImageScreenWM> {
  final String url;
  final bool isTest;

  const NasaImageScreen({
    required this.url,
    WidgetModelFactory wmFactory = createNasaImageWM,
    Key? key,
    this.isTest = false,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IImageScreenWM wm) {
    return Scaffold(
      appBar: AppBarWidget(
        title: wm.imageScreenTitle,
        onBackTap: wm.onBackTap,
      ),
      body: SafeArea(
        child: ValueListenableBuilder<bool>(
          valueListenable: wm.isSavingProcess,
          builder: (_, data, __) {
            return Stack(
              children: [
                Opacity(
                  opacity: data ? 0.5 : 1.0,
                  child: Column(
                    children: [
                      Expanded(
                        child: isTest
                            ? Image.asset(
                                'assets/placeholder_image.jpeg',
                              )
                            : PhotoView(
                                imageProvider: NetworkImage(url),
                                heroAttributes: PhotoViewHeroAttributes(
                                  tag: url,
                                ),
                                backgroundDecoration: BoxDecoration(
                                  color: wm.photoViewBackground,
                                ),
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: wm.isFavorite,
                            builder: (_, __, ___) {
                              return ButtonWidget(
                                title: wm.favoriteButtonTitle,
                                onTap: () => wm.onFavoriteButtonTap(url),
                              );
                            },
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
                if (data)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
