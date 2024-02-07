part of 'home_bloc.dart';

enum ScreenStatus { init, loading, success, failure, changeTab }

@immutable
class HomeState {
  final ScreenStatus? screenStatus;
  List<CategoryBrandDataEntity>? categories;
  List<CategoryBrandDataEntity>? brands;

  HomeState({this.screenStatus, this.categories, this.brands});

  HomeState copyWith(
      {ScreenStatus? screenStatus,
      List<CategoryBrandDataEntity>? categories,
      List<CategoryBrandDataEntity>? brands}) {
    return HomeState(
        screenStatus: screenStatus ?? this.screenStatus,
        brands: brands ?? this.brands,
        categories: categories ?? this.categories);
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(screenStatus: ScreenStatus.init);
}
