import '../../data/repositories/firebase_auth_repository.dart';

class SignOutUseCase {
  final FirebaseAuthRepository _authRepository;

  SignOutUseCase(this._authRepository);

  Future<void> signOut() {
    return _authRepository.signOut();
  }
}
