import 'package:auth/src/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tData = User.empty();

  test(
    'user.mapper [copyWith] should return a [User] with correct value',
    () {
      const newValue = 'test';
      final actual = tData.copyWith(username: newValue);
      expect(actual, isA<User>());
      expect(actual.username, isNot(equals(tData.username)));
      expect(actual.username, equals(newValue));
    },
  );

  test(
    'user.mapper [fromJson] should return a [User] with correct value',
    () {
      final actual = UserMapper.fromJson(tData.asJson());
      expect(actual, isA<User>());
      expect(actual, equals(tData));
    },
  );

  test(
    'user.mapper [fromMap] should return a [User] with correct value',
    () {
      final actual = UserMapper.fromMap(tData.asMap());
      expect(actual, isA<User>());
      expect(actual, equals(tData));
    },
  );
}
