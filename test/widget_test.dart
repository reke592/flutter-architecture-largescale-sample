import 'package:flutter_test/flutter_test.dart';

import 'package:largescale/main.dart';
import 'package:largescale/src/core/bootstrap.dart';

void main() {
  testWidgets('main bootstrap', (WidgetTester tester) async {
    await bootstrap();
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.text('Sign-in'), findsOneWidget);
    expect(find.text('Dashboard'), findsNothing);
  });
}
