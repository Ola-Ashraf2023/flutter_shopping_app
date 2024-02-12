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

class SelectSubcategoryEvent extends HomeEvent {
  bool selected;
  String? cat;
  String? subcat;

  SelectSubcategoryEvent(this.selected, this.cat, this.subcat);
}

class SelectProductEvent extends HomeEvent {
  bool selectedProduct;

  SelectProductEvent(this.selectedProduct);
}
