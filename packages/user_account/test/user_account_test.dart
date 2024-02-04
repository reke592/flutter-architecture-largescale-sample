import 'package:commons/commons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_account/user_account.dart';

void main() {
  test('extends [ModuleInstaller]', () {
    // update the actual value with the [ModuleInstaller] implementation.
    final actual = UserAccountModule();
    expect(actual, isA<ModuleInstaller>());
  });
}
