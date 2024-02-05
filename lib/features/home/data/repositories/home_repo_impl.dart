import 'package:shopping_app/features/home/domain/repositories/home_repo.dart';

import '../../domain/entities/CategoryEntity.dart';
import '../data_sources/remote/home_remote_ds.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDataSource categoriesRemoteDataSource;

  HomeRepoImpl(this.categoriesRemoteDataSource);

  Future<CategoryEntity> getCategories() =>
      categoriesRemoteDataSource.sendCategoryRequest();
}
