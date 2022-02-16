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
    const listViewPadding = EdgeInsets.symmetric(horizontal: 16);

    const picturePadding = EdgeInsets.symmetric(vertical: 8);

    return ValueListenableBuilder<List<MarsPhoto>>(
      valueListenable: wm.marsPhotos,
      builder: (_, data, __) {
        return data.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: listViewPadding,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NetworkImageWidget(
                        url: data[index].imageSource,
                        isTest: isTest,
                        padding: picturePadding,
                        height: MediaQuery.of(context).size.height / 3,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 8),
                    ],
                  );
                },
              );
      },
    );
  }
}
