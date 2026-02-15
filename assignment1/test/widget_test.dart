import 'package:flutter_test/flutter_test.dart';

import 'package:assignment1/app.dart';

void main() {
  testWidgets('VangtiChai app renders correctly', (WidgetTester tester) async {
    // Build VangtiChai and trigger a frame.
    await tester.pumpWidget(const VangtiChaiApp());

    // Verify that the app title and initial amount are shown.
    expect(find.text('VangtiChai'), findsOneWidget);
    expect(find.text('Taka: '), findsOneWidget);
    expect(find.text('0'), findsWidgets); // initial amount + table zeros

    // Verify the custom keypad is rendered (digit buttons 1–9, 0, CLEAR).
    expect(find.text('1'), findsWidgets);
    expect(find.text('CLEAR'), findsOneWidget);
  });
}
