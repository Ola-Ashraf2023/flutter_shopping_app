import 'package:shopping_app/features/home/domain/repositories/home_repo.dart';

import '../entities/Category_and_brand_entity.dart';

class GetBrandsUseCase {
  HomeRepo homeRepo;

  GetBrandsUseCase(this.homeRepo);

  Future<CategoryBrandEntity> call() => homeRepo.getBrands();
}
