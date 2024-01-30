import 'package:auth/src/data/datasources/auth_remote_data_source.dart';
import 'package:auth/src/data/datasources/implementations/auth_remote_data_source_impl.dart';
import 'package:auth/src/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tUser = User.empty();
  late AuthRemoteDataSource sut;

  setUp(() {
    sut = AuthRemoteDataSourceImpl();
  });

  group(
    'AuthRemoteDataSourceImpl',
    () {
      test(
        'implementation extends [AuthRemoteDataSource]',
        () async {
          expect(sut, isA<AuthRemoteDataSource>());
        },
      );

      test(
        'should send client request on login',
        () async {
          await sut.login(
            username: 'username',
            password: 'password',
          );
        },
      );

      test(
        'shoud send client request on refresh',
        () async {
          await sut.refresh(tUser);
        },
      );
    },
  );
}
