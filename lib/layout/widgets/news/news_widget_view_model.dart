import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';

class NewsWidgetViewModel extends ChangeNotifier {
  List<News>? newsList;

  String? errorMessage;

  void getNewsBySourceId(String sourceId) async {
    newsList = null;
    errorMessage = null;
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId: sourceId);
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
