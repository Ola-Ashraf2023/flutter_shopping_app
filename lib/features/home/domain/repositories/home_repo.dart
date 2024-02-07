import '../entities/Category_and_brand_entity.dart';

abstract class HomeRepo {
  Future<CategoryBrandEntity> getCategories();

  Future<CategoryBrandEntity> getBrands();
}
