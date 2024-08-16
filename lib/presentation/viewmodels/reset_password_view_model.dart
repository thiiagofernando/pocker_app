import 'package:flutter/material.dart';

import '../../domain/usecases/reset_password_usecase.dart';

class ResetPasswordViewModel {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordViewModel(this._resetPasswordUseCase);

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier(null);

  Future<void> resetPassword(BuildContext context, String email) async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      await _resetPasswordUseCase.resetPassword(email);
      isLoading.value = false;
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Link de recuperação de senha enviado para $email')),
      );
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = e.toString();
    }
  }
}
