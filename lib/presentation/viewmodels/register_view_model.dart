import 'package:flutter/material.dart';

import '../../domain/usecases/register_usecase.dart';

class RegisterViewModel {
  final RegisterUseCase _registerUseCase;

  RegisterViewModel(this._registerUseCase);

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier(null);

  Future<void> register(BuildContext context, String email, String password) async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      await _registerUseCase.register(email, password);
      isLoading.value = false;
      if (!context.mounted) return;
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = e.toString();
    }
  }
}
