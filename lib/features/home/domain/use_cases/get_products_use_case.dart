import 'package:shopping_app/features/home/domain/repositories/home_repo.dart';

import '../entities/ProductEntity.dart';

class GetProductsUseCase {
  String? cat;
  String? subcat;
  HomeRepo homeRepo;

  GetProductsUseCase(this.homeRepo, this.cat, this.subcat);

  Future<ProductEntity> call(String? cat, String? subcat) =>
      homeRepo.getProducts(cat, subcat);
}
