import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthCubit() : super(AuthState.initial());

  Future<void> signUp(String email, String password) async {
    emit(state.copyWith(loading: true, error: ''));
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      if (user != null) {
        emit(state.copyWith(loading: false, authenticated: true));
      } else {
        emit(state.copyWith(loading: false, error: 'Failed to sign up'));
      }
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(loading: false, error: e.message ?? 'An error occurred'));
    }
  }

  Future<void> login(String email, String password) async {
    emit(state.copyWith(loading: true, error: ''));
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      if (user != null) {
        emit(state.copyWith(loading: false, authenticated: true));
      } else {
        emit(state.copyWith(loading: false, error: 'Failed to log in'));
      }
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(loading: false, error: e.message ?? 'An error occurred'));
    }
  }

  Future<void> signOut() async {
    emit(state.copyWith(loading: true, error: ''));
    try {
      await _auth.signOut();
      emit(state.copyWith(loading: false, authenticated: false));
    } catch (e) {
      emit(state.copyWith(loading: false, error: 'Failed to sign out'));
    }
  }
}