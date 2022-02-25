import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/services/articles_service.dart';
import 'package:nasa_app/services/models/article.dart';

class ArticlesModel extends ElementaryModel {
  final ValueNotifier<List<Article>> articles = ValueNotifier([]);

  final ArticlesService? _articlesService;

  ArticlesModel(this._articlesService);

  Future<void> getArticles() async {
    final value = await _articlesService?.getArticles();
    articles.value = value ?? [];
  }
}