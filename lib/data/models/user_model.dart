import 'package:pocker_app/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.email});

  factory UserModel.fromFirebase(User user) {
    return UserModel(email: user.email);
  }
}
