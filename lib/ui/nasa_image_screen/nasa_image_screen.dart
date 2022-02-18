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
    wm.initFavorite(url);

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
