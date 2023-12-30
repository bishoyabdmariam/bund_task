import 'dart:async';
import 'package:bundtask/Presentation/Widgets/InvestmentCalculatorWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vibration/vibration.dart';

void main() {
  testWidgets('Investment Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: InvestmentCalculatorWidget(),
        ),
      ),
    );

    // Verify the initial state.
    expect(find.text('Investment Amount'), findsOneWidget);
    expect(find.text('\$10000'), findsOneWidget);
    expect(find.text('6.81% YTM'), findsOneWidget);

    // Tap on the "add" button and verify the updated investment amount.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('\$11000'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('\$1000'), findsOneWidget);

    // Long press on the "remove" button and verify the updated investment amount.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('\$2000'), findsOneWidget);

    // Ensure the snackbar is shown when trying to decrease below the minimum.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('\$250'), findsOneWidget);
    expect(find.text('250\$ is the least amount'), findsOneWidget);
  });
}
