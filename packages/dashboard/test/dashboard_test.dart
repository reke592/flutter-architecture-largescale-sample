import 'package:commons/commons.dart';
import 'package:dashboard/dashboard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('extends [FeatureInstaller]', () {
    final actual = Dashboard();
    expect(actual, isA<FeatureInstaller>());
  });
}
