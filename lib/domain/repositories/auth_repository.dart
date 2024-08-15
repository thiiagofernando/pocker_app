abstract class AuthRepository {
  Future<void> signInWithEmailAndPassword(String email, String password);
}
