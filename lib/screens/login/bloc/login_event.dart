part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent extends LoginEvent {
  final User user;

  const LoginUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

class ShowPasswordEvent extends LoginEvent {
  final bool isShown;

  const ShowPasswordEvent(this.isShown);

  @override
  List<Object> get props => [isShown];
}
