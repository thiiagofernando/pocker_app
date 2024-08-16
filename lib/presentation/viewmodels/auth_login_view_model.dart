import 'package:flutter/material.dart';

import '../../domain/usecases/sign_out_usecase.dart';

class AuthViewModel {
  final SignOutUseCase _signOutUseCase;

  AuthViewModel(this._signOutUseCase);

  Future<void> signOut(BuildContext context) async {
    await _signOutUseCase.signOut();
    if (!context.mounted) return;
    Navigator.pushReplacementNamed(context, '/');
  }
}
