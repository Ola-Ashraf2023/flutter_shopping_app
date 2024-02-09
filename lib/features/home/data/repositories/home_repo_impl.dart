import 'package:shopping_app/features/home/domain/repositories/home_repo.dart';

import '../../domain/entities/Category_and_brand_entity.dart';
import '../data_sources/remote/home_remote_ds.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDataSource categoriesRemoteDataSource;

  HomeRepoImpl(this.categoriesRemoteDataSource);

  @override
  Future<CategoryBrandEntity> getCategories() =>
      categoriesRemoteDataSource.sendCategoryRequest();

  @override
  Future<CategoryBrandEntity> getBrands() =>
      categoriesRemoteDataSource.sendBrandRequest();

  @override
  Future<CategoryBrandEntity> getSubcategories(String? id) =>
      categoriesRemoteDataSource.sendSubcategoryRequest(id);
}
