import 'package:auth/src/data/datasources/auth_cache_data_source.dart';
import 'package:auth/src/data/datasources/auth_remote_data_source.dart';
import 'package:auth/src/data/repositories/auth_repository_impl.dart';
import 'package:auth/src/domain/auth_repository.dart';
import 'package:auth/src/domain/entities/user.dart';
import 'package:commons/commons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthCacheDataSource extends Mock implements AuthCacheDataSource {}

void main() {
  const tUser = User.empty();
  final tException = Exception('test');
  late AuthRepository authRepo;
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockAuthCacheDataSource mockAuthCacheDataSource;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    mockAuthCacheDataSource = MockAuthCacheDataSource();
    authRepo = AuthRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      cacheDataSource: mockAuthCacheDataSource,
    );
  });

  group('AuthRepositoryImpl.login', () {
    test(
      'should call [AuthDataSource.login]',
      () async {
        // arrange
        when(
          () => mockRemoteDataSource.login(
            username: any(named: 'username'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((invocation) async => tUser);

        // act
        final result = await authRepo.login(
          username: 'username',
          password: 'password',
        );

        // assert
        verify(
          () => mockRemoteDataSource.login(
            username: 'username',
            password: 'password',
          ),
        ).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
        expect(result, equals(const Right<Failure, User>(tUser)));
      },
    );

    test(
      'shoud return a UnknownFailure on datasource unhandled exception',
      () async {
        // arrange
        when(
          () => mockRemoteDataSource.login(
            username: any(named: 'username'),
            password: any(named: 'password'),
          ),
        ).thenThrow(tException);

        // act
        final result = await authRepo.login(
          username: 'username',
          password: 'password',
        );

        // assert
        verify(
          () => mockRemoteDataSource.login(
            username: 'username',
            password: 'password',
          ),
        ).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
        expect(result.isLeft(), equals(true));
        result.fold((l) => expect(l, isA<UnknownFailure>()), (r) => null);
      },
    );
  });

  group('AuthRepositoryImpl.logout', () {
    test(
      'should call [AuthDataSource.logout] and clear the cache data',
      () async {
        // arrange
        when(
          () => mockRemoteDataSource.logout(tUser),
        ).thenAnswer((_) => Future.value());
        when(
          () => mockAuthCacheDataSource.clear(),
        ).thenAnswer((_) => Future.value());

        // act
        final result = await authRepo.logout(tUser);

        // assert
        verify(
          () => mockRemoteDataSource.logout(tUser),
        ).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
        verify(
          () => mockAuthCacheDataSource.clear(),
        ).called(1);
        verifyNoMoreInteractions(mockAuthCacheDataSource);
        expect(result, equals(const Right<Failure, void>(null)));
      },
    );
    test(
      'shoud return UnknownFailure on datasource unhandled exception',
      () async {
        // arrange
        when(() => mockRemoteDataSource.logout(tUser)).thenThrow(tException);

        // act
        final result = await authRepo.logout(tUser);

        // assert
        verify(
          () => mockRemoteDataSource.logout(tUser),
        ).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
        expect(result.isLeft(), equals(true));
        result.fold((l) => expect(l, isA<UnknownFailure>()), (r) => null);
      },
    );
  });

  group('AuthRepositoryImpl.refresh', () {
    setUp(() {
      registerFallbackValue(tUser);
    });

    test(
      'should load cache data before making request '
      'and update the cache on successful response',
      () async {
        // arrange
        when(
          () => mockAuthCacheDataSource.load(),
        ).thenAnswer((_) async => tUser);
        when(
          () => mockAuthCacheDataSource.save(any()),
        ).thenAnswer((_) => Future.value());
        when(
          () => mockRemoteDataSource.refresh(any()),
        ).thenAnswer((_) async => tUser);

        // act
        final result = await authRepo.refresh();

        // assert
        verify(() => mockAuthCacheDataSource.load()).called(1);
        verify(() => mockRemoteDataSource.refresh(tUser)).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
        verify(() => mockAuthCacheDataSource.save(tUser)).called(1);
        verifyNoMoreInteractions(mockAuthCacheDataSource);
        expect(result.isRight(), equals(true));
        result.fold((l) => null, (r) => expect(r, equals(tUser)));
      },
    );
  });
}
