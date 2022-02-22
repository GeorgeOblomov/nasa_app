import 'package:flutter/material.dart';
import 'package:nasa_app/utils/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackTap;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  const AppBarWidget({
    required this.title,
    required this.onBackTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: onBackTap,
      ),
      backgroundColor: appBarBackground,
    );
  }
}
