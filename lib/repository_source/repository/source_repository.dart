import 'package:news/model/SourceResponse.dart';

abstract class SourceRepositoryContract {
  Future<SourceResponse> getSources(categoryId);
}
