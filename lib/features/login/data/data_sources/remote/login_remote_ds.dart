import '../../../../signup/data/models/UserModel.dart';
import '../../models/login_request_data.dart';

abstract class LoginRemoteDataSource {
  Future<UserModel> login(LoginRequestData requestData);
}
