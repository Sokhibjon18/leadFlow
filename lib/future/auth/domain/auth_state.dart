part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required final bool loading,
    required final String error,
    required final bool authenticated,
  }) = _AuthState;

  factory AuthState.googleSignIn({
    required bool loading,
    required String error,
    required bool authenticated,
  }) =>
      AuthState(
        error: error,
        loading: loading,
        authenticated: authenticated,
      );
  factory AuthState.initial() => const AuthState(
        loading: false,
        error: '',
        authenticated: false,
      );
}
