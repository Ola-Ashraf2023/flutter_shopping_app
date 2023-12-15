part of 'login_bloc.dart';

enum ScreenStatus { Init, Loading, Success, Failure }

@immutable
class LoginState {
  final ScreenStatus? screenStatus;
  final UserEntity? userEntity;

  LoginState({this.screenStatus, this.userEntity});

  LoginState copyWith({ScreenStatus? screenStatus, UserEntity? userEntity}) {
    return LoginState(
        screenStatus: screenStatus ?? this.screenStatus,
        userEntity: userEntity ?? this.userEntity);
  }
}

class LoginInitial extends LoginState {
  LoginInitial() : super(screenStatus: ScreenStatus.Init);
}
