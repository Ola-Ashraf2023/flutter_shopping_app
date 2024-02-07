import '../entities/Category_and_brand_entity.dart';
import '../repositories/home_repo.dart';

class GetCategoriesUseCase {
  HomeRepo getCategoriesRepo;

  GetCategoriesUseCase(this.getCategoriesRepo);

  Future<CategoryBrandEntity> call() => getCategoriesRepo.getCategories();
}
