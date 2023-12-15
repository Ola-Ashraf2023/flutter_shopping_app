import '../../../signup/domain/entities/UserEntity.dart';
import '../../data/models/login_request_data.dart';

abstract class LoginRepo {
  Future<UserEntity> login(LoginRequestData requestData);
}
