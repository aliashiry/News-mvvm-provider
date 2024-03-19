import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/core/api/api_constants.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesApi,
        {'apiKey': '7e972317ca474537b6e8487e3aa933a2', 'category': categoryId});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  // https://newsapi.org/v2/everything?q=bitcoin&apiKey=eaa6b39dce56462fab8a511c1a44d1c3
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'apiKey': '7e972317ca474537b6e8487e3aa933a2',
      'sources': sourceId,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
