part of 'home_bloc.dart';

enum ScreenStatus { init, loading, success, failure, changeTab }

@immutable
class HomeState {
  final ScreenStatus? screenStatus;
  List<CategoryDataEntity>? categories;

  HomeState({this.screenStatus, this.categories});

  HomeState copyWith(
      {ScreenStatus? screenStatus, List<CategoryDataEntity>? categories}) {
    return HomeState(
        screenStatus: screenStatus ?? this.screenStatus,
        categories: categories ?? this.categories);
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(screenStatus: ScreenStatus.init);
}
