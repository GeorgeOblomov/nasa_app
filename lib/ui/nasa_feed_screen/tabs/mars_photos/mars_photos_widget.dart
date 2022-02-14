import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/services/models/mars_photo.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/mars_photos/i_mars_photos_wm.dart';
import 'package:nasa_app/ui/widgets/network_image_widget.dart';

class MarsPhotosWidget extends ElementaryWidget<IMarsPhotosWM> {
  final bool isTest;

  const MarsPhotosWidget({
    Key? key,
    WidgetModelFactory wmFactory = createMarsPhotosWM,
    this.isTest = false,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IMarsPhotosWM wm) {
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
                          NetworkImageWidget(url: photo.imageSource, isTest: isTest),
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
