import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/generated/l10n.dart';
import 'package:nasa_app/services/models/article.dart';
import 'package:nasa_app/ui/articles_screen/i_articles_wm.dart';
import 'package:nasa_app/ui/articles_screen/widgets/article_item_widget.dart';
import 'package:nasa_app/ui/widgets/i_navigation_item_data.dart';
import 'package:nasa_app/utils/app_text_styles.dart';

class ArticlesScreen extends ElementaryWidget<IArticlesWM>
    implements INavigationItemData {
  final bool isTest;

  const ArticlesScreen({
    WidgetModelFactory wmFactory = createArticlesScreenWM,
    this.isTest = false,
    Key? key,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IArticlesWM wm) {
    const titlePadding = EdgeInsets.only(left: 16);
    const listViewPadding = EdgeInsets.symmetric(horizontal: 8);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: titlePadding,
          child: Text(
            wm.articlesScreenTitle,
            style: AppTextStyles.screenHeader,
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ValueListenableBuilder<List<Article>>(
            valueListenable: wm.articles,
            builder: (_, data, __) {
              return data.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      padding: listViewPadding,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ArticleItemWidget(
                          article: data[index],
                          onTap: () => wm.onArticleTap(data[index].sourceUrl),
                          isTest: isTest,
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                    );
            },
          ),
        ),
      ],
    );
  }

  @override
  IconData getIcon() => Icons.article;

  @override
  String getLabel() => S.current.articlesTitle;
}
