import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/layout/widgets/news/news_item.dart';
import 'package:news/layout/widgets/news/news_widget_view_model.dart';
import 'package:news/model/NewsResponse.dart';

class NewsSearch extends SearchDelegate {
  late Future<NewsResponse?> getNewsDataModel;

  NewsSearch() {
    getNewsDataModel = ApiManager.getNewsBySourceId(searchKeyword: "");
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.clear,
        size: 32,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //  ApiManager.getNewsBySourceId(searchKeyword:query);
    return FutureBuilder(
      future: ApiManager.getNewsBySourceId(searchKeyword: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("something went wrong"));
        }
        var articls = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: articls[index]);
            },
            itemCount: articls.length,
          ),
        );
      },
    );
  }

  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search'),
    );
  }
}
