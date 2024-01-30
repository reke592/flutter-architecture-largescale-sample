import 'package:auth/src/domain/auth_repository.dart';
import 'package:auth/src/domain/entities/user.dart';
import 'package:auth/src/domain/usecases/logout.dart';
import 'package:commons/commons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthRepository {}

void main() {
  const tUser = User(id: '1', username: 'test');
  late MockAuthRepo mockAuthRepo;
  late Logout usecase;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    usecase = Logout(mockAuthRepo);
  });

  group('Logout', () {
    test(
      'should call [AuthRepository.login] with right parameters '
      'and return [Right<Failure, void>] on success',
      () async {
        // arrange
        when(
          () => mockAuthRepo.logout(tUser),
        ).thenAnswer((_) async => const Right(null));

        // act
        final result = await usecase(tUser);

        // assert
        verify(() => mockAuthRepo.logout(tUser)).called(1);
        verifyNoMoreInteractions(mockAuthRepo);
        expect(result.isRight(), equals(true));
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
          () => mockAuthRepo.logout(tUser),
        ).thenAnswer((_) async => const Left(error));

        // act
        final result = await usecase(tUser);

        // assert
        verify(() => mockAuthRepo.logout(tUser)).called(1);
        verifyNoMoreInteractions(mockAuthRepo);
        expect(result.isLeft(), equals(true));
        result.fold((l) => expect(l, equals(error)), (r) => null);
      },
    );
  });
}
