import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/api_manager.dart';
import '../../../signup/domain/entities/UserEntity.dart';
import '../../data/data_sources/remote/login_remote_ds.dart';
import '../../data/data_sources/remote/login_remote_ds_impl.dart';
import '../../data/models/login_request_data.dart';
import '../../data/repositories/login_repo_impl.dart';
import '../../domain/repositories/login_repo.dart';
import '../../domain/use_cases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  ApiManager apiManager;

  static LoginBloc get(context) => BlocProvider.of(context);

  LoginBloc(this.apiManager) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(screenStatus: ScreenStatus.Loading));
      LoginRemoteDataSource remoteDataSource =
          LoginRemoteDataSourceImpl(apiManager);
      LoginRepo loginRepo = LoginRepoImpl(remoteDataSource);
      LoginUseCase loginUseCase = LoginUseCase(loginRepo);
      try {
        LoginRequestData requestData =
            LoginRequestData(email: "lola21@gmail.com", password: "password");
        UserEntity userEntity = await loginUseCase.call(requestData);
        print("success state should be changed");
        emit(state.copyWith(
            screenStatus: ScreenStatus.Success, userEntity: userEntity));
        print("state chamged to success");
      } catch (e) {
        print(e.toString());
        emit(state.copyWith(screenStatus: ScreenStatus.Failure));
      }
    });
  }
}
