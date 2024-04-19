import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendify/features/auth/domain/entities/user.dart';
import 'package:spendify/features/auth/domain/usecases/user_sign_in.dart';
import 'package:spendify/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
      final res = await _userSignUp(UserSignUpParams(
          email: event.email, password: event.password, name: event.name));

      res.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (user) => emit(
          AuthSuccess(user),
        ),
      );
    });
    on<AuthSignIn>((event, emit) async {
      emit(AuthLoading());
      final res = await _userSignIn(
          UserSignInParams(email: event.email, password: event.password));

      res.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (user) => emit(
          AuthSuccess(user),
        ),
      );
    });
  }
}
