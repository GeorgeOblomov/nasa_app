import 'package:flutter/material.dart';
import 'package:nasa_app/services/models/article.dart';
import 'package:nasa_app/ui/widgets/network_image_widget.dart';
import 'package:nasa_app/utils/app_colors.dart';

class ArticleItemWidget extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;
  final bool isTest;

  const ArticleItemWidget({
    required this.article,
    required this.onTap,
    required this.isTest,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const cardHeight = 120.0;
    const imageWidth = 150.0;

    const cardPadding = EdgeInsets.all(8.0);

    return InkWell(
      onTap: onTap,
      child: PhysicalModel(
        color: articleItemBackground!,
        borderRadius: BorderRadius.circular(16),
        elevation: 3,
        child: Container(
          padding: cardPadding,
          height: cardHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NetworkImageWidget(
                isTest: isTest,
                url: article.imageUrl,
                width: imageWidth,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(article.title),
                    const SizedBox(height: 16),
                    Text(article.publishedAt),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
