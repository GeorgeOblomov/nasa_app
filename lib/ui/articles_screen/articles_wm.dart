import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/services/models/article.dart';
import 'package:nasa_app/ui/articles_screen/articles_model.dart';
import 'package:nasa_app/ui/articles_screen/articles_screen.dart';
import 'package:nasa_app/ui/articles_screen/i_articles_wm.dart';

class ArticlesWM extends WidgetModel<ArticlesScreen, ArticlesModel>
    implements IArticlesWM {
  @override
  ValueListenable<List<Article>> get articles => model.articles;

  ArticlesWM(ArticlesModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.getArticles();
  }

  @override
  void onArticleTap(String url) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => Container(),
      ),
    );
  }
}
