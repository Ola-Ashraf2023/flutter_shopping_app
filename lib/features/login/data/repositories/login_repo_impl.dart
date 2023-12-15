import 'package:shopping_app/features/login/data/data_sources/remote/login_remote_ds.dart';
import 'package:shopping_app/features/login/domain/repositories/login_repo.dart';
import 'package:shopping_app/features/signup/domain/entities/UserEntity.dart';

import '../models/login_request_data.dart';

class LoginRepoImpl implements LoginRepo {
  LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl(this.loginRemoteDataSource);

  @override
  Future<UserEntity> login(LoginRequestData requestData) =>
      loginRemoteDataSource.login(requestData);
}
