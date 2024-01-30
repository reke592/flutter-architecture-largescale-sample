import 'package:auth/src/domain/entities/user.dart';
import 'package:commons/commons.dart';

abstract class AuthRepository {
  /// login using username and password
  ResultFuture<User> login({
    required String username,
    required String password,
  });

  /// logout current user
  ResultVoid logout(User param);

  /// refresh current user access using cached data
  ResultFuture<User> refresh();
}
