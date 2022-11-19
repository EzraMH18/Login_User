part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isHidePassword;

  const LoginState({
    this.isHidePassword = true,
  });

  LoginState copyWith({
    bool? isHidePassword,
  }) {
    return LoginState(
      isHidePassword: isHidePassword ?? this.isHidePassword,
    );
  }

  @override
  List<Object> get props => [
        isHidePassword,
      ];
}

class LoginLoadingState extends LoginState {}

class LoginStatusState extends LoginState {
  final bool isSuccess;
  final User data;

  const LoginStatusState(this.isSuccess, this.data);

  @override
  List<Object> get props => [data, isSuccess];
}
