import '../entities/CategoryEntity.dart';

abstract class HomeRepo {
  Future<CategoryEntity> getCategories();
}
