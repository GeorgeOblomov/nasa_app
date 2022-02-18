import 'package:flutter/material.dart';
import 'package:nasa_app/extensions/localization_extension.dart';
import 'package:nasa_app/ui/nasa_image_screen/nasa_image_screen.dart';
import 'package:nasa_app/utils/app_colors.dart';
import 'package:transparent_image/transparent_image.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;
  final bool isTest;
  final EdgeInsets? padding;
  final double? height;
  final double? width;

  const NetworkImageWidget({
    required this.url,
    required this.isTest,
    this.padding,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onImageTap(context, url),
      child: Container(
        padding: padding,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: imageBackground,
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            const Center(child: CircularProgressIndicator()),
            Center(
              child: Hero(
                tag: url,
                child: FadeInImage(
                  placeholder: isTest
                      ? const AssetImage(
                          'assets/placeholder_image.jpeg',
                        )
                      : MemoryImage(kTransparentImage) as ImageProvider,
                  image: NetworkImage(url),
                  imageErrorBuilder: (
                    _,
                    __,
                    ___,
                  ) {
                    return Container(
                      color: imageBackground,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                          const SizedBox(height: 8),
                          Text(context.localizations.errorText),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onImageTap(BuildContext context, String url) {
    Navigator.push(context,
      MaterialPageRoute<void>(
        builder: (context) => NasaImageScreen(
          url: url,
        ),
      ),
    );
  }
}
