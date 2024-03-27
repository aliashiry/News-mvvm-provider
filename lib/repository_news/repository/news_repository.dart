import 'package:news/model/NewsResponse.dart';

abstract class NewsRepositoryContract {
  Future<NewsResponse?> getNews(String sourceId);
}
