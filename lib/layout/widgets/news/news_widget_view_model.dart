import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/repository_news/data_source/news_data_source.dart';
import 'package:news/repository_news/data_source/news_data_source_impl.dart';
import 'package:news/repository_news/repository/news_repository.dart';
import 'package:news/repository_news/repository/news_repository_impl.dart';

class NewsWidgetViewModel extends ChangeNotifier {
  late NewsRepositoryContract newsRepositoryContract;
  late NewsRemoteDataSource newsRemoteDataSource;
  late ApiManager apiManager;

  NewsWidgetViewModel() {
    apiManager = ApiManager();
    newsRemoteDataSource = NewsRemoteDataSourceImpl(apiManager: apiManager);
    newsRepositoryContract =
        NewsRepositoryImpl(newsRemoteDataSource: newsRemoteDataSource);
  }

  List<News>? newsList;

  String? errorMessage;

  void getNews(
    String sourceId,
  ) async {
    newsList = null;
    errorMessage = null;
    try {
      var response = await newsRepositoryContract.getNews(sourceId);
      if (response?.status == 'error') {
        errorMessage = response!.message;
      } else {
        newsList = response!.articles;
      }
    } catch (e) {
      errorMessage = 'Erorr Loading News  List';
    }
    notifyListeners();
  }
}
