import 'package:shopping_app/features/signup/data/models/request_data.dart';

import '../entities/UserEntity.dart';

abstract class SignUpRepo {
  Future<UserEntity> SignUp(RequestData requestData);
}
