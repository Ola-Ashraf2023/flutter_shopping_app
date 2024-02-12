import '../entities/Category_and_brand_entity.dart';
import '../entities/ProductEntity.dart';

abstract class HomeRepo {
  Future<CategoryBrandEntity> getCategories();

  Future<CategoryBrandEntity> getBrands();

  Future<CategoryBrandEntity> getSubcategories(String? id);

  Future<ProductEntity> getProducts(String? cat, String? subcat);
}
