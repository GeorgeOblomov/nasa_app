import 'package:flutter/material.dart';
import 'package:nasa_app/extensions/localization_extension.dart';
import 'package:nasa_app/ui/widgets/button_widget.dart';
import 'package:nasa_app/utils/app_colors.dart';
import 'package:photo_view/photo_view.dart';

class NasaImageScreen extends StatelessWidget {
  final String url;

  const NasaImageScreen({required this.url, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.imageViewScreenTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
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
                    BoxDecoration(color: Theme.of(context).canvasColor),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  title: context.localizations.addToFavorite,
                  onTap: () {},
                ),
                ButtonWidget(
                  title: context.localizations.save,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
