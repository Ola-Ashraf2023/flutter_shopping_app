import 'package:shopping_app/features/signup/data/models/request_data.dart';
import 'package:shopping_app/features/signup/domain/repositories/signup_repo.dart';

import '../entities/UserEntity.dart';

class SignUpUseCase {
  SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);

  Future<UserEntity> call(RequestData requestData) =>
      signUpRepo.SignUp(requestData);
}
