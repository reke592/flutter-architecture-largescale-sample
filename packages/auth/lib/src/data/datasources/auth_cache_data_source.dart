import 'package:auth/src/domain/entities/user.dart';

abstract class AuthCacheDataSource {
  /// save user data in local storage
  Future<void> save(User data);

  /// load user data from local storage
  Future<User?> load();

  /// delete user data in local storage
  Future<void> clear();
}
