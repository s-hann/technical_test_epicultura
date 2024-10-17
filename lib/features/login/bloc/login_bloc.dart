import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/core/domain/repository/repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<Login>(_login);
  }

  final _repository = Repository();

  Future<void> _login(
    Login event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        status: LoginStatus.loading,
        errorMessage: '',
      ),
    );
    final login = await _repository.login(
      email: event.email,
      password: event.password,
    );
    login.fold(
      (l) {
        emit(
          state.copyWith(
            status: LoginStatus.failure,
            errorMessage: l,
          ),
        );
      },
      (_) {
        emit(state.copyWith(status: LoginStatus.success));
      },
    );
  }
}
