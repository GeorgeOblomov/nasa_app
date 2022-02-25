import 'package:nasa_app/services/http_clients/i_http_client.dart';
import 'package:nasa_app/services/models/article.dart';
import 'package:nasa_app/utils/const.dart';

class ArticlesService {
  final IHttpClient httpClient;

  ArticlesService(this.httpClient);

  Future<List<Article>> getArticles() async {
     final responseBody = await httpClient.get('$spaceFlightBaseUrl/articles') as List;

     final result = <Article>[];

     for (final article in responseBody) {
       result.add(Article.fromJson(article as Map<String, dynamic>));
     }

     return result;
  }
}