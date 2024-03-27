import 'package:news/model/SourceResponse.dart';
import 'package:news/repository_source/data_source/source_data_source.dart';
import 'package:news/repository_source/repository/source_repository.dart';

class SourceRepositoryImpl implements SourceRepositoryContract {
  SourceRemoteDataSource sourceRemoteDataSource;

  SourceRepositoryImpl({required this.sourceRemoteDataSource});

  @override
  Future<SourceResponse> getSources(categoryId) {
    return sourceRemoteDataSource.getSources(categoryId);
  }
}
