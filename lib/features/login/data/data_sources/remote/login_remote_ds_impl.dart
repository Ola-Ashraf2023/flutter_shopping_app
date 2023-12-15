import 'package:dio/dio.dart';

import '../../../../../core/api/api_manager.dart';
import '../../../../../core/api/endpoints.dart';
import '../../../../signup/data/models/UserModel.dart';
import '../../models/login_request_data.dart';
import 'login_remote_ds.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  ApiManager apiManager;

  LoginRemoteDataSourceImpl(this.apiManager);

  @override
  Future<UserModel> login(LoginRequestData requestData) async {
    try {
      Response response = await apiManager.postData(
          endPoint: Endpoints.signIn, body: requestData.toJson());
      UserModel userModel = UserModel.fromJson(response.data);
      return userModel;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
    ;
  }
}
