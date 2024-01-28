import 'package:auth/src/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login({
    required String username,
    required String password,
  });

  Future<void> logout();
}
