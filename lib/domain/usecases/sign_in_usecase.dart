import 'package:pocker_app/domain/repositories/auth_repository.dart';

class SignInUsecase {
  final AuthRepository repository;
  SignInUsecase({
    required this.repository,
  });

  Future<void> call(String email, String password) async {
    await repository.signInWithEmailAndPassword(email, password);
  }
}
