import 'package:flutter/material.dart';
import 'package:nasa_app/utils/app_text_styles.dart';
import 'package:nasa_app/utils/const.dart';

class NasaAboutScreen extends StatelessWidget {

  const NasaAboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 200),
            const SizedBox(height: 50),
            Text(appDescription, style: AppTextStyles.description),
          ],
        ),
      ),
    );
  }

  static String getTitle() => aboutPageTitle;

  static IconData getIcon() => Icons.account_circle;
}