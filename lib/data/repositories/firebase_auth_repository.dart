import 'package:firebase_auth/firebase_auth.dart';
import 'package:pocker_app/core/errors/exceptions.dart';
import 'package:pocker_app/data/datasources/firebase_auth_datasource.dart';
import 'package:pocker_app/domain/repositories/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuthDataSource _firebaseAuthDataSource;
  FirebaseAuthRepository(
    this._firebaseAuthDataSource,
  );

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuthDataSource.signInWithEmailAndPassword(email, password);
    } on FirebaseAuthException catch (e) {
      throw AuthenticationException('Erro ao Autenticacar: ${e.message}');
    } catch (e) {
      throw ServerException('Erro no servidor: ${e.toString}');
    }
  }
}
