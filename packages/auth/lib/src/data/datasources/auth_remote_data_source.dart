import 'package:auth/src/domain/entities/user.dart';

abstract class AuthRemoteDataSource {
  /// send login request to remote server
  Future<User> login({
    required String username,
    required String password,
  });

  /// send logout request to remote server
  Future<void> logout(User param);

  /// request updated user access from the remote server
  Future<User> refresh(User param);
}
