import 'package:flutter/material.dart';
import 'package:nasa_app/utils/const.dart';
import 'package:transparent_image/transparent_image.dart';

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
        : FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(url),
            fit: BoxFit.cover,
            placeholderErrorBuilder: (
              _,
              __,
              ___,
            ) {
              return Column(
                children: const [
                  Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  SizedBox(height: 8),
                  Text(errorText),
                ],
              );
            },
          );
  }
}
