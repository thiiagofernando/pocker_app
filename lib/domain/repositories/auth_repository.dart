abstract class AuthRepository {
  Future<void> signIn(String email, String password);
  Future<void> register(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> signOut();
}
