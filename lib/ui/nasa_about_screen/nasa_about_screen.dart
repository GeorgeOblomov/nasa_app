import 'package:flutter/material.dart';
import 'package:nasa_app/extensions/localization_extension.dart';
import 'package:nasa_app/utils/app_text_styles.dart';

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
            Text(
              context.localizations.appDescription,
              style: AppTextStyles.description,
            ),
          ],
        ),
      ),
    );
  }

  static String getTitle(BuildContext context) =>
      context.localizations.aboutScreenTitle;

  static IconData getIcon() => Icons.account_circle;
}
