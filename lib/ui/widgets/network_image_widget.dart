import 'package:flutter/material.dart';
import 'package:nasa_app/extensions/localization_extension.dart';
import 'package:transparent_image/transparent_image.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;
  final bool isTest;
  final EdgeInsets? padding;
  final double? height;
  final double? width;

  const NetworkImageWidget(
      {required this.url, required this.isTest, this.padding, this.height, this.width, Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: FadeInImage(
              placeholder: isTest
                  ? const AssetImage(
                'assets/placeholder_image.jpeg',
              )
                  : MemoryImage(kTransparentImage) as ImageProvider,
              image: NetworkImage(url),
              imageErrorBuilder: (_,
                  __,
                  ___,) {
                return Container(
                  color: imageBackground,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      SizedBox(height: 8),
                      Text(errorText),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
