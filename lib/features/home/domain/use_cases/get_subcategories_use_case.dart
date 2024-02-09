import 'package:shopping_app/features/home/domain/entities/Category_and_brand_entity.dart';
import 'package:shopping_app/features/home/domain/repositories/home_repo.dart';

class GetSubcategoriesUseCase {
  HomeRepo homeRepo;
  String? id;

  GetSubcategoriesUseCase(this.homeRepo, this.id);

  Future<CategoryBrandEntity> call(String? id) => homeRepo.getSubcategories(id);
}
