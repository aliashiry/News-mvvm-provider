import 'package:flutter/cupertino.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  List<Source>? sourcesList;
  String? errorMessage;

  void getSource(String categoryId) async {
    sourcesList = null;
    errorMessage = null;
    var response = await ApiManager.getSources(categoryId);
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
