import 'package:dio/dio.dart';
import 'package:shopping_app/core/api/endpoints.dart';
import 'package:shopping_app/features/signup/data/data_sources/remote/remote_ds.dart';
import 'package:shopping_app/features/signup/data/models/UserModel.dart';
import 'package:shopping_app/features/signup/data/models/request_data.dart';

import '../../../../../core/api/api_manager.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  ApiManager apiManager;

  RemoteDataSourceImpl(this.apiManager);

  @override
  Future<UserModel> signUp(RequestData requestData) async {
    try {
      Response response = await apiManager.postData(
          endPoint: Endpoints.signUp, body: requestData.toJson());
      UserModel userModel = UserModel.fromJson(response.data);
      return userModel;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
    ;
  }
}
