import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/usecases/get_current_usecase.dart';
import 'package:flutter/material.dart';

class UserViewModel {
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  UserViewModel(this._getCurrentUserUseCase);

  final ValueNotifier<User?> currentUser = ValueNotifier(null);

  void loadCurrentUser() {
    currentUser.value = _getCurrentUserUseCase();
  }
}
