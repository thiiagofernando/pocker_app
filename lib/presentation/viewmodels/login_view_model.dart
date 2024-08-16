import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pocker_app/domain/usecases/sign_in_usecase.dart';

class LoginViewModel {
  final SignInUsecase _signInUsecase;
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<String?> errorMessage = ValueNotifier(null);

  LoginViewModel(this._signInUsecase);

  Future<void> login(BuildContext context, String email, String password) async {
    isLoading.value = true;
    errorMessage.value = null;
    try {
      await _signInUsecase.call(email, password);
      isLoading.value = false;
      if (!context.mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
        case 'invalid-credential':
          errorMessage.value = 'O email informado é inválido.';
          break;
        case 'user-disabled':
          errorMessage.value = 'Este usuário foi desativado';
          break;
        case 'user-not-found':
          errorMessage.value = 'Usuário não encontrado.';
          break;
        case 'wrong-password':
          errorMessage.value = 'Senha incorreta';
          break;
        default:
          errorMessage.value = 'Erro desconhecido ${e.message}';
          break;
      }
    } catch (e) {
      errorMessage.value = 'Ocorreu um erro inesperado. Tente novamente';
    } finally {
      isLoading.value = false;
    }
  }
}
