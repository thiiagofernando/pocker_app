import 'package:firebase_auth/firebase_auth.dart';

import '../../data/repositories/firebase_auth_repository.dart';

class GetCurrentUserUseCase {
  final FirebaseAuthRepository _authRepository;

  GetCurrentUserUseCase(this._authRepository);

  User? call() {
    return _authRepository.getCurrentUser();
  }
}
