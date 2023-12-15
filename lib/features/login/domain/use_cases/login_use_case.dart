import 'package:shopping_app/features/login/domain/repositories/login_repo.dart';

import '../../../signup/domain/entities/UserEntity.dart';
import '../../data/models/login_request_data.dart';

class LoginUseCase {
  LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  Future<UserEntity> call(LoginRequestData requestData) =>
      loginRepo.login(requestData);
}
