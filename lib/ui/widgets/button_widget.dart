import 'package:flutter/material.dart';
import 'package:nasa_app/utils/app_colors.dart';
import 'package:nasa_app/utils/app_text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ButtonWidget({required this.title, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const randomButtonPadding = EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 16,
    );
    const randomButtonMargin = EdgeInsets.symmetric(vertical: 24);

    return Container(
      margin: randomButtonMargin,
      padding: randomButtonPadding,
      child: ElevatedButton(
        style: ButtonStyle(
          shape:
          MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color?>(
            buttonColor,
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: AppTextStyles.randomButton,
        ),
      ),
    );
  }
}
