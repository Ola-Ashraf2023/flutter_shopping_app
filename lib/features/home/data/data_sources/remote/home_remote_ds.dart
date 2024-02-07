import '../../models/category_brand_model.dart';

abstract class HomeRemoteDataSource {
  Future<CategoryBrandModel> sendCategoryRequest();

  Future<CategoryBrandModel> sendBrandRequest();
}
