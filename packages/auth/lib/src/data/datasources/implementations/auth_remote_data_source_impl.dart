import 'package:auth/src/data/datasources/auth_remote_data_source.dart';
import 'package:auth/src/domain/entities/user.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<User> login({required String username, required String password}) {
    // TODO(login): implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout(User param) async {
    /// noop
  }

  @override
  Future<User> refresh(User param) {
    // TODO(refresh): implement refresh
    throw UnimplementedError();
  }
}
