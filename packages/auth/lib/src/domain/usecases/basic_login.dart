import 'package:auth/src/domain/auth_repository.dart';
import 'package:auth/src/domain/entities/user.dart';
import 'package:commons/commons.dart';

class BasicLoginParams extends Equatable {
  const BasicLoginParams({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}

class BasicLogin extends UsecaseWithParam<User, BasicLoginParams> {
  BasicLogin(this._repo);

  final AuthRepository _repo;

  @override
  ResultFuture<User> call(BasicLoginParams param) {
    return _repo.login(
      username: param.username,
      password: param.password,
    );
  }
}
