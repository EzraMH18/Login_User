part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final bool isHidePassword;
  final bool isHideConfirmPassword;

  const RegisterState({
    this.isHidePassword = true,
    this.isHideConfirmPassword = true,
  });

  RegisterState copyWith({
    bool? isShownPassword,
    bool? isShownConfirmPassword,
  }) {
    return RegisterState(
      isHidePassword: isShownPassword ?? isHidePassword,
      isHideConfirmPassword: isShownConfirmPassword ?? isHideConfirmPassword,
    );
  }

  @override
  List<Object> get props => [
        isHidePassword,
        isHideConfirmPassword,
      ];
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
