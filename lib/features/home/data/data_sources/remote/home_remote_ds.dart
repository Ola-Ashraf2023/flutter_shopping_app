import '../../models/ProductModel.dart';
import '../../models/category_brand_model.dart';

abstract class HomeRemoteDataSource {
  Future<CategoryBrandModel> sendCategoryRequest();

  Future<CategoryBrandModel> sendBrandRequest();

  Future<CategoryBrandModel> sendSubcategoryRequest(String? id);

  Future<ProductModel> sendProductRequest(String? cat, String? subcat);
}
