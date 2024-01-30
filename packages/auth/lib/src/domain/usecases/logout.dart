import 'package:auth/src/domain/auth_repository.dart';
import 'package:auth/src/domain/entities/user.dart';
import 'package:commons/commons.dart';

class Logout extends UsecaseWithParam<void, User> {
  Logout(this._repo);

  final AuthRepository _repo;

  @override
  ResultFuture<void> call(User param) {
    return _repo.logout(param);
  }
}
