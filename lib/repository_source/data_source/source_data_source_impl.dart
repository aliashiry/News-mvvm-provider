import 'package:news/core/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/repository_source/data_source/source_data_source.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManager apiManager;

  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse> getSources(categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response;
  }
}
