import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/repository_source/data_source/source_data_source.dart';
import 'package:news/repository_source/data_source/source_data_source_impl.dart';
import 'package:news/repository_source/repository/source_repository.dart';
import 'package:news/repository_source/repository/source_repository_impl.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  late SourceRepositoryContract sourceRepositoryContract;
  late SourceRemoteDataSource sourceRemoteDataSource;
  late ApiManager apiManager;

  CategoryDetailsViewModel() {
    apiManager = ApiManager();
    sourceRemoteDataSource = SourceRemoteDataSourceImpl(apiManager: apiManager);
    sourceRepositoryContract =
        SourceRepositoryImpl(sourceRemoteDataSource: sourceRemoteDataSource);
  }
  List<Source>? sourcesList;
  String? errorMessage;
  int selectedIndex = 0;

  void updateSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void getSource(String categoryId) async {
    sourcesList = null;
    errorMessage = null;
    var response = await sourceRepositoryContract.getSources(categoryId);
    try {
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        sourcesList = response.sources;
      }
    } catch (e) {
      errorMessage = 'Error Loading  List Sources';
    }
    notifyListeners();
  }
}
