import '../../data/repositories/firebase_auth_repository.dart';

class SignInUsecase {
  final FirebaseAuthRepository repository;
  SignInUsecase(this.repository);

  Future<void> call(String email, String password) async {
    await repository.signIn(email, password);
  }
}
