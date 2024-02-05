import 'package:dio/dio.dart';
import 'package:shopping_app/core/api/api_manager.dart';
import 'package:shopping_app/core/api/endpoints.dart';
import 'package:shopping_app/features/home/data/data_sources/remote/home_remote_ds.dart';

import '../../models/category_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl(this.apiManager);

  @override
  Future<CategoryModel> sendCategoryRequest() async {
    try {
      Response response =
          await apiManager.getData(endPoint: Endpoints.category, data: {});
      CategoryModel categoryModel = CategoryModel.fromJson(response.data);
      return categoryModel;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
}