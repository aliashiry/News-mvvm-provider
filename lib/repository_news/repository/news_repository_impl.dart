import 'package:news/model/NewsResponse.dart';
import 'package:news/repository_news/data_source/news_data_source.dart';
import 'package:news/repository_news/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepositoryContract {
  NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl({required this.newsRemoteDataSource});

  @override
  Future<NewsResponse?> getNews(String sourceId) {
    var response = newsRemoteDataSource.getNews(sourceId);
    return response;
  }
}
