import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../data/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _repo;

  AuthBloc(this._repo) : super(AuthState.initial()) {
    on<_SignInWithGoogle>((event, emit) async {
      if (state.loading) return;

      emit(AuthState.googleSignIn(
        loading: true,
        error: '',
        authenticated: false,
      ));
      try {
        await _repo.signInWithGoogle();
        emit(AuthState.googleSignIn(
          loading: false,
          error: '',
          authenticated: true,
        ));
      } catch (e) {
        emit(AuthState.googleSignIn(
          loading: false,
          error: '$e',
          authenticated: false,
        ));
      }
    });
  }
}
