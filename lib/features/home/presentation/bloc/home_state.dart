part of 'home_bloc.dart';

enum ScreenStatus {
  init,
  loading,
  success,
  failure,
  changeTab,
  changeCategory,
  selectSubcategory,
  selectProduct
}

@immutable
class HomeState {
  final ScreenStatus? screenStatus;
  List<CategoryBrandDataEntity>? categories;
  List<CategoryBrandDataEntity>? brands;
  List<CategoryBrandDataEntity>? subcategories;
  List<ProductDataEntity>? products;

  HomeState(
      {this.screenStatus,
      this.categories,
      this.brands,
      this.subcategories,
      this.products});

  HomeState copyWith(
      {ScreenStatus? screenStatus,
      List<CategoryBrandDataEntity>? categories,
      List<CategoryBrandDataEntity>? brands,
      List<CategoryBrandDataEntity>? subcategories,
      List<ProductDataEntity>? products}) {
    return HomeState(
        screenStatus: screenStatus ?? this.screenStatus,
        brands: brands ?? this.brands,
        categories: categories ?? this.categories,
        subcategories: subcategories ?? this.subcategories,
        products: products ?? this.products);
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(screenStatus: ScreenStatus.init);
}
