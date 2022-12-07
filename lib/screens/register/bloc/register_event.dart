part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterUserEvent extends RegisterEvent {
  final User user;

  const RegisterUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

class ShowPasswordEvent extends RegisterEvent {
  final bool isShown;

  const ShowPasswordEvent(this.isShown);

  @override
  List<Object?> get props => [isShown];
}

class ShowConfirmPasswordEvent extends RegisterEvent {
  final bool isShown;

  const ShowConfirmPasswordEvent(this.isShown);

  @override
  List<Object?> get props => [isShown];
}
