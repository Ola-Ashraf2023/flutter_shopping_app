part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetCategoryEvent extends HomeEvent {}

class GetBrandEvent extends HomeEvent {}

class ChangeNavbarEvent extends HomeEvent {
  int index;

  ChangeNavbarEvent(this.index);
}
