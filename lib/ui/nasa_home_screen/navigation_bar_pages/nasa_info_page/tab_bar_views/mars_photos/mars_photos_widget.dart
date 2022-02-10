import 'package:cached_network_image/cached_network_image.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/services/models/mars_photo.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/mars_photos/i_mars_photos_model.dart';

class MarsPhotosWidget extends ElementaryWidget<IMarsPhotosModel> {
  const MarsPhotosWidget({
    Key? key,
    WidgetModelFactory wmFactory = createMarsPhotosWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IMarsPhotosModel wm) {
    return ValueListenableBuilder<List<MarsPhoto>>(
      valueListenable: wm.marsPhotos,
      builder: (_, data, __) {
        return data.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    for (final photo in data)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CachedNetworkImage(imageUrl: photo.imageSource),
                          const SizedBox(height: 8),
                        ],
                      ),
                  ],
                ),
              );
      },
    );
  }
}
