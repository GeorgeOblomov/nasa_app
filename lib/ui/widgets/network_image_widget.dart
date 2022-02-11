import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/utils/const.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;
  final bool isTest;

  const NetworkImageWidget({required this.url, required this.isTest, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isTest
        ? Image.asset(
            'assets/placeholder_image.jpeg',
            fit: BoxFit.cover,
          )
        : CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            // ignore: implicit_dynamic_parameter
            errorWidget: (context, url, error) => Column(
              children: const [
                Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                SizedBox(height: 8),
                Text(errorText),
              ],
            ),
            fit: BoxFit.cover,
          );
  }
}
