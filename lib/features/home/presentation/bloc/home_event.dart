part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetCategoryEvent extends HomeEvent {}

class GetBrandEvent extends HomeEvent {}

class ChangeNavbarEvent extends HomeEvent {
  int index;

  ChangeNavbarEvent(this.index);
}

class ChangeCategoryEvent extends HomeEvent {
  int catIndex;
  String? id;

  ChangeCategoryEvent(this.catIndex, this.id);
}

class SelectCategoryEvent extends HomeEvent {
  bool selected;

  SelectCategoryEvent(this.selected);
}

class SelectProductEvent extends HomeEvent {
  bool selectedProduct;

  SelectProductEvent(this.selectedProduct);
}
