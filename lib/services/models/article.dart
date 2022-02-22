import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'url')
  final String sourceUrl;
  @JsonKey(name: 'imageUrl')
  final String imageUrl;
  @JsonKey(name: 'publishedAt')
  late final String publishedAt;

  Article({
    required this.title,
    required this.sourceUrl,
    required this.imageUrl,
    required String publishedAt,
  }) {
    this.publishedAt = _formatPublishedAt(publishedAt);
  }

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  String _formatPublishedAt(String date) {
    return date.split('T').first.toString();
  }
}
