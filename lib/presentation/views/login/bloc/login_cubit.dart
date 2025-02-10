import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/storage/local_storage.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LocalStorage localStorage;
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  LoginCubit(this.localStorage) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    // Evita múltiples emisiones de Loginloading
    if (state is! LoginLoading) {
      emit(LoginLoading());
    }

    final isSessionValid = await localStorage.isSessionValid();

    if (isSessionValid) {
      emit(
          LoginSuccess()); // Si ya está validada, emite LoginSuccess directamente
    } else {
      // Si no hay sesión válida, procede con el login normal
      Future.delayed(Duration(seconds: 2), () {
        if (email == 'admin@example.com' && password == '123') {
          String token = 'simulated_token_123';

          localStorage.saveToken(token);

          emit(LoginSuccess());
        } else {
          emit(LoginError('Correo o contraseña invalida'));
        }
      });
    }
  }

  Future<void> logout() async {
    await localStorage.removeToken();
    emit(LoginInitial()); // Emite estado inicial después de cerrar sesión
  }
}
