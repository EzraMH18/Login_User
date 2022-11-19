import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/auth_repository.dart';
import '../../../models/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginUserEvent>((event, emit) async {
      emit(LoginLoadingState());
      var response = await AuthRepositoryImpl().login(event.user);
      final user = response.data?.user;
      if (user != null) {
        emit(LoginStatusState(true, user));
      }
    });
    on<ShowPasswordEvent>(
        (event, emit) => emit(state.copyWith(isHidePassword: event.isShown)));
  }
}
