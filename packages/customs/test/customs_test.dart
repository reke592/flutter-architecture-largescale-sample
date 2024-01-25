import 'package:commons/commons.dart';
import 'package:customs/customs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('extends [FeatureInstaller]', () {
    final actual = Customs();
    expect(actual, isA<FeatureInstaller>());
  });
}
