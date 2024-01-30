import 'package:auth/src/core/constants.dart';
import 'package:auth/src/data/datasources/auth_cache_data_source.dart';
import 'package:auth/src/data/datasources/implementations/auth_cache_data_source_impl.dart';
import 'package:auth/src/domain/entities/user.dart';
import 'package:commons/commons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSharedPrefs extends Mock implements SharedPreferences {}

void main() {
  const tUser = User.empty();
  late AuthCacheDataSource sut;
  late SharedPreferences mockPrefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    mockPrefs = MockSharedPrefs();
    sut = AuthCacheDataSourceImpl(mockPrefs);
  });

  group('AuthCacheDataSourceImpl', () {
    test(
      'implementation extends AuthCacheDataSource',
      () async {
        expect(sut, isA<AuthCacheDataSource>());
      },
    );

    test(
      'load method should read [SharedPreferences]',
      () async {
        // arrange
        when(() => mockPrefs.reload()).thenAnswer((_) => Future.value());
        when(() => mockPrefs.getString(kAuthUserCacheName))
            .thenReturn(tUser.asJson());
        // act
        final result = await sut.load();
        // assert
        verify(() => mockPrefs.reload()).called(1);
        verify(() => mockPrefs.getString(kAuthUserCacheName)).called(1);
        verifyNoMoreInteractions(mockPrefs);
        expect(result, equals(tUser));
      },
    );

    test(
      'save should write JSON string into [SharedPreferences] '
      'using const key [kAuthUserCacheName]',
      () async {
        // arrange
        when(() => mockPrefs.setString(any(), any()))
            .thenAnswer((invocation) async => Future.value(true));
        // act
        await sut.save(tUser);
        // assert
        verify(() => mockPrefs.setString(kAuthUserCacheName, tUser.asJson()))
            .called(1);
        verifyNoMoreInteractions(mockPrefs);
      },
    );
  });
}
