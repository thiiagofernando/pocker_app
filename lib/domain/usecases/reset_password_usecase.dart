import '../../data/repositories/firebase_auth_repository.dart';

class ResetPasswordUseCase {
  final FirebaseAuthRepository _authRepository;

  ResetPasswordUseCase(this._authRepository);

  Future<void> resetPassword(String email) {
    return _authRepository.resetPassword(email);
  }
}
