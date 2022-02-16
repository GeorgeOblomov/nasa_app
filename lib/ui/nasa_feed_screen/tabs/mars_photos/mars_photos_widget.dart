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
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: double.infinity,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: NetworkImageWidget(
                          url: data[index].imageSource,
                          isTest: isTest,
                        ),
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
