import 'package:firebase_auth/firebase_auth.dart';
import 'package:pocker_app/domain/entities/user_local.dart';

class UserModel extends UserLocal {
  UserModel({required super.email});

  factory UserModel.fromFirebase(User user) {
    return UserModel(email: user.email);
  }
}
