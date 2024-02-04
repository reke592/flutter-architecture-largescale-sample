import 'package:commons/commons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_notifications/user_notifications.dart';

void main() {
  test('extends [ModuleInstaller]', () {
    // update the actual value with the [ModuleInstaller] implementation.
    final actual = UserNotificationsModule();
    expect(actual, isA<ModuleInstaller>());
  });
}
