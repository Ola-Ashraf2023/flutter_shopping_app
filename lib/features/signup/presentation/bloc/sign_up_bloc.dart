import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/core/api/api_manager.dart';
import 'package:shopping_app/features/signup/data/data_sources/remote/remote_ds.dart';
import 'package:shopping_app/features/signup/data/models/request_data.dart';
import 'package:shopping_app/features/signup/data/repositories/signup_repo_impl.dart';
import 'package:shopping_app/features/signup/domain/entities/UserEntity.dart';
import 'package:shopping_app/features/signup/domain/repositories/signup_repo.dart';
import 'package:shopping_app/features/signup/domain/use_cases/signup_usecase.dart';

import '../../data/data_sources/remote/remote_ds_impl.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  ApiManager apiManager;

  static SignUpBloc get(context) => BlocProvider.of(context);

  SignUpBloc(this.apiManager) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is RegisterEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.Loading));
        RemoteDataSource remoteDataSource = RemoteDataSourceImpl(apiManager);
        SignUpRepo signUpRepo = SignUpRepoImpl(remoteDataSource);
        SignUpUseCase signUpUseCase = SignUpUseCase(signUpRepo);

        try {
          RequestData requestData = RequestData(
              name: "lola21",
              email: "lola21@gmail.com",
              password: "password",
              rePassword: "password",
              phone: "01111111111");
          UserEntity userEntity = await signUpUseCase.call(requestData);
          print("success state should be changed");
          emit(state.copyWith(
              screenStatus: ScreenStatus.Success, userEntity: userEntity));
          print("state chamged to success");
        } catch (e) {
          print(e.toString());
          print("cryyyyyiiiingggg");
          emit(state.copyWith(screenStatus: ScreenStatus.Failure));
        }
      }
    });
  }
}
