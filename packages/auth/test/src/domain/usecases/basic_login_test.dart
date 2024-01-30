import 'package:auth/src/domain/auth_repository.dart';
import 'package:auth/src/domain/entities/user.dart';
import 'package:auth/src/domain/usecases/basic_login.dart';
import 'package:commons/commons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthRepository {}

void main() {
  const tUser = User(id: '1', username: 'test');
  const tParams = BasicLoginParams(
    username: 'username',
    password: 'password',
  );
  late MockAuthRepo mockAuthRepo;
  late BasicLogin usecase;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    usecase = BasicLogin(mockAuthRepo);
  });

  group('BasicLogin', () {
    test(
      'should call [AuthRepository.login] with right parameters '
      'and return [Right<Failure, User>] on success',
      () async {
        // arrange
        const success = Right<Failure, User>(tUser);
        when(
          () => mockAuthRepo.login(
            username: any(named: 'username'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => success);

        // act
        final result = await usecase(tParams);

        // assert
        verify(
          () => mockAuthRepo.login(
            username: tParams.username,
            password: tParams.password,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockAuthRepo);
        expect(result, equals(success));
      },
    );

    test(
      'should return the repository Failure on error',
      () async {
        // arrange
        const error = UnknownFailure(
          message: 'message',
          statusCode: 'statusCode',
        );
        when(
          () => mockAuthRepo.login(
            username: any(named: 'username'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => const Left(error));

        // act
        final result = await usecase(tParams);
        verify(
          () => mockAuthRepo.login(
            username: tParams.username,
            password: tParams.password,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockAuthRepo);
        expect(result.isLeft(), equals(true));
        result.fold((l) => expect(l, equals(error)), (r) => null);
      },
    );
  });
}
