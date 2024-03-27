import 'package:news/core/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/repository_news/data_source/news_data_source.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponse?> getNews(String sourceId) async {
    var response = await apiManager.getNewsBySourceId(sourceId: sourceId);
    return response;
  }
}
