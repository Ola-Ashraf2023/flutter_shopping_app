import '../entities/CategoryEntity.dart';
import '../repositories/home_repo.dart';

class GetCategoriesUseCase {
  HomeRepo getCategoriesRepo;

  GetCategoriesUseCase(this.getCategoriesRepo);

  Future<CategoryEntity> call() => getCategoriesRepo.getCategories();
}
