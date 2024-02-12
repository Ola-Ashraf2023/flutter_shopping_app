import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/features/home/data/data_sources/remote/home_remote_ds.dart';
import 'package:shopping_app/features/home/data/data_sources/remote/home_remote_ds_impl.dart';
import 'package:shopping_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:shopping_app/features/home/domain/repositories/home_repo.dart';
import 'package:shopping_app/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:shopping_app/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:shopping_app/features/home/domain/use_cases/get_subcategories_use_case.dart';

import '../../../../core/api/api_manager.dart';
import '../../domain/entities/Category_and_brand_entity.dart';
import '../../domain/entities/ProductEntity.dart';
import '../../domain/use_cases/get_brands_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ApiManager apiManager;
  int idx = 1;
  int catIdx = 0;
  bool selected = false;
  bool selectedProduct = false;

  static HomeBloc get(context) => BlocProvider.of(context);

  HomeBloc(this.apiManager) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetCategoryEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        HomeRemoteDataSource homeRemoteDataSource =
            HomeRemoteDataSourceImpl(apiManager);
        HomeRepo homeRepo = HomeRepoImpl(homeRemoteDataSource);
        GetCategoriesUseCase getCategoriesUseCase =
            GetCategoriesUseCase(homeRepo);
        try {
          var res = await getCategoriesUseCase.call();
          emit(state.copyWith(
              screenStatus: ScreenStatus.success, categories: res.data));
        } catch (e) {
          print(e.toString());
          emit(state.copyWith(screenStatus: ScreenStatus.failure));
        }
      } else if (event is GetBrandEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        HomeRemoteDataSource homeRemoteDataSource =
            HomeRemoteDataSourceImpl(apiManager);
        HomeRepo homeRepo = HomeRepoImpl(homeRemoteDataSource);
        GetBrandsUseCase getBrandsUseCase = GetBrandsUseCase(homeRepo);
        try {
          var res = await getBrandsUseCase.call();
          emit(state.copyWith(
              screenStatus: ScreenStatus.success, brands: res.data));
        } catch (e) {
          print(e.toString());
          emit(state.copyWith(screenStatus: ScreenStatus.failure));
        }
      } else if (event is ChangeNavbarEvent) {
        idx = event.index;
        emit(state.copyWith(screenStatus: ScreenStatus.changeTab));
      } else if (event is ChangeCategoryEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.changeCategory));
        catIdx = event.catIndex;
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        HomeRemoteDataSource homeRemoteDataSource =
            HomeRemoteDataSourceImpl(apiManager);
        HomeRepo homeRepo = HomeRepoImpl(homeRemoteDataSource);
        GetSubcategoriesUseCase getSubcategoriesUseCase =
            GetSubcategoriesUseCase(homeRepo, event.id);
        try {
          var res = await getSubcategoriesUseCase.call(event.id);
          emit(state.copyWith(
              screenStatus: ScreenStatus.success, subcategories: res.data));
        } catch (e) {
          print(e.toString());
          emit(state.copyWith(screenStatus: ScreenStatus.failure));
        }
      } else if (event is SelectSubcategoryEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.selectSubcategory));
        selected = event.selected;
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        HomeRemoteDataSource homeRemoteDataSource =
            HomeRemoteDataSourceImpl(apiManager);
        HomeRepo homeRepo = HomeRepoImpl(homeRemoteDataSource);
        GetProductsUseCase getProductsUseCase =
            GetProductsUseCase(homeRepo, event.cat, event.subcat);
        try {
          var res = await getProductsUseCase.call(event.cat, event.subcat);
          //  print("helloooooooooooooooooooooooooooooooo");
          // print(res.data?[0]??"Null");
          emit(state.copyWith(
              screenStatus: ScreenStatus.success, products: res.data));
        } catch (e) {
          print("hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
          print(e.toString());
          emit(state.copyWith(screenStatus: ScreenStatus.failure));
        }
      } else if (event is SelectProductEvent) {
        selectedProduct = event.selectedProduct;
        emit(state.copyWith(screenStatus: ScreenStatus.selectProduct));
      }
    });
  }
}
