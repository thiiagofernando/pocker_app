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
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuthDataSource.signIn(email, password);
    } on FirebaseAuthException catch (e) {
      throw AuthenticationException('Erro ao Autenticacar: ${e.message}');
    } catch (e) {
      throw ServerException('Erro no servidor: ${e.toString}');
    }
  }

  @override
  Future<void> register(String email, String password) async {
    try {
      await _firebaseAuthDataSource.register(email, password);
    } on FirebaseAuthException catch (e) {
      throw AuthenticationException('Erro ao se registrar: ${e.message}');
    } catch (e) {
      throw ServerException('Erro no servidor: ${e.toString}');
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuthDataSource.resetPassword(email);
    } on FirebaseAuthException catch (e) {
      throw AuthenticationException('Erro ao resetar a senha: ${e.message}');
    } catch (e) {
      throw ServerException('Erro no servidor: ${e.toString}');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuthDataSource.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthenticationException('Erro ao sair do sistemas: ${e.message}');
    } catch (e) {
      throw ServerException('Erro no servidor: ${e.toString}');
    }
  }
}
