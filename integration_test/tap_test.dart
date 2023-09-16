import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firebase_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    "Testing cold boot login flow",
    () {
      testWidgets(
        "test for navigating from login to home screen",
        (tester) async {
          await app.main();
          await tester.pumpAndSettle();

          var countText = find.text("0");
          expect(countText, findsOneWidget);

          var tapButton = find.byType(FloatingActionButton);
          expect(tapButton, findsOneWidget);

          await tester.tap(tapButton);
          await tester.pumpAndSettle();
          await tester.tap(tapButton);
          await tester.pumpAndSettle();

          var countText2 = find.text("2");
          expect(countText2, findsOneWidget);
        },
        timeout: const Timeout(
          Duration(minutes: 5),
        ),
      );
    },
  );
}
