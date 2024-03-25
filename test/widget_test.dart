import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:malepa_redesign/main.dart'; // Import your app's main widget

void main() {
  testWidgets('Test Firebase Initialization and Series Selection',
      (WidgetTester tester) async {
    // Build your app and trigger a frame.
    await tester.pumpWidget(
        const MalepaApp()); // Replace MalepaApp with your app's main widget

    // Tap the "Begin" button to trigger Firebase initialization and navigate to the series selection screen.
    await tester.tap(find.text('Begin'));
    await tester.pumpAndSettle(); // Wait for the UI to update

    // Verify that the "Select a series:" text is present on the series selection screen.
    expect(
        find.byWidgetPredicate(
          (widget) => widget is Text && widget.data == 'Malepa login',
        ),
        findsOneWidget);
  });
}
