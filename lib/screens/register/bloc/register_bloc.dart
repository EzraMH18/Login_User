import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:register_login/models/user_model.dart';

import '../../../data/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoadingState());
      var response = await AuthRepositoryImpl().register(event.user);
      final user = response.data?.user;
      if (response.data != null) {
        emit(RegisterStatusState(true, user!));
      }
    });
    on<ShowPasswordEvent>(
        (event, emit) => emit(state.copyWith(isShownPassword: event.isShown)));
    on<ShowConfirmPasswordEvent>((event, emit) =>
        emit(state.copyWith(isShownConfirmPassword: event.isShown)));
  }
}
