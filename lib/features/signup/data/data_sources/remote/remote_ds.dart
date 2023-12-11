import 'package:shopping_app/features/signup/data/models/request_data.dart';

import '../../models/UserModel.dart';

abstract class RemoteDataSource {
  Future<UserModel> signUp(RequestData requestData);
}
