import 'package:commons/commons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_home/user_home.dart';

void main() {
  test('extends [ModuleInstaller]', () {
    // update the actual value with the [ModuleInstaller] implementation.
    final actual = UserHomeModule();
    expect(actual, isA<ModuleInstaller>());
  });
}
