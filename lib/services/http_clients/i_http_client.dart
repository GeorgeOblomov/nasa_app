// ignore: one_member_abstracts
abstract class IHttpClient {
  Future<Map<String, dynamic>> get(String url);
}