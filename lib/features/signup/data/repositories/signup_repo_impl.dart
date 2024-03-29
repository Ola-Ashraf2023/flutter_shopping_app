import 'package:shopping_app/features/signup/data/models/request_data.dart';
import 'package:shopping_app/features/signup/domain/entities/UserEntity.dart';

import '../../domain/repositories/signup_repo.dart';
import '../data_sources/remote/signup_remote_ds.dart';

class SignUpRepoImpl implements SignUpRepo {
  @override
  SignUpRemoteDataSource remoteDataSource;

  SignUpRepoImpl(this.remoteDataSource);

  Future<UserEntity> SignUp(RequestData requestData) =>
      remoteDataSource.signUp(requestData);
}
