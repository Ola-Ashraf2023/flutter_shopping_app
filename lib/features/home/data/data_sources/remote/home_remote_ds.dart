import '../../models/category_model.dart';

abstract class HomeRemoteDataSource {
  Future<CategoryModel> sendCategoryRequest();
}
