import '../../data/repositories/firebase_auth_repository.dart';

class RegisterUseCase {
  final FirebaseAuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<void> register(String email, String password) {
    return _authRepository.register(email, password);
  }
}
