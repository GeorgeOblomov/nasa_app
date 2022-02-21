import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nasa_app/di/injector_widget.dart';
import 'package:nasa_app/services/models/article.dart';
import 'package:nasa_app/ui/articles_screen/articles_model.dart';
import 'package:nasa_app/ui/articles_screen/articles_wm.dart';

abstract class IArticlesWM extends IWidgetModel {
  ValueListenable<List<Article>> get articles;

  void onArticleTap(String url);
}

ArticlesWM createArticlesScreenWM(BuildContext context) {
  return ArticlesWM(
    ArticlesModel(InjectorWidget.maybeOf(context)?.articleService),
  );
}
