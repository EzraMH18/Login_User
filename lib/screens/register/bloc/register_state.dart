part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final bool isHidePassword;

  const RegisterState({
    this.isHidePassword = true,
  });

  RegisterState copyWith({
    bool? isShownPassword,
  }) {
    return RegisterState(
      isHidePassword: isShownPassword ?? isHidePassword,
    );
  }

  @override
  List<Object> get props => [isHidePassword];
}

class RegisterLoadingState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterStatusState<T> extends RegisterState {
  final bool isSuccess;
  final User data;

  const RegisterStatusState(this.isSuccess, this.data);

  @override
  List<Object> get props => [data, isSuccess];
}
