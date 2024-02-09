part of 'home_bloc.dart';

enum ScreenStatus {
  init,
  loading,
  success,
  failure,
  changeTab,
  changeCategory,
  selectCategory,
  selectProduct
}

@immutable
class HomeState {
  final ScreenStatus? screenStatus;
  List<CategoryBrandDataEntity>? categories;
  List<CategoryBrandDataEntity>? brands;
  List<CategoryBrandDataEntity>? subcategories;

  HomeState(
      {this.screenStatus, this.categories, this.brands, this.subcategories});

  HomeState copyWith(
      {ScreenStatus? screenStatus,
      List<CategoryBrandDataEntity>? categories,
      List<CategoryBrandDataEntity>? brands,
      List<CategoryBrandDataEntity>? subcategories}) {
    return HomeState(
        screenStatus: screenStatus ?? this.screenStatus,
        brands: brands ?? this.brands,
        categories: categories ?? this.categories,
        subcategories: subcategories ?? this.subcategories);
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(screenStatus: ScreenStatus.init);
}
