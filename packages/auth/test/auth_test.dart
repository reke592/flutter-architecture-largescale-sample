import 'package:auth/auth.dart';
import 'package:commons/commons.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('extends [FeatureInstaller]', () {
    final actual = Auth();
    expect(actual, isA<ModuleInstaller>());
  });
}
