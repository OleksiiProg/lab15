import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lab15/main.dart';
import 'package:lab15/function_calculator.dart';

void main() {
  group('FunctionCalculator tests', () {
    test('Should calculate y = 100 - (x + x^2)', () {
      final calculator = FunctionCalculator();
      expect(calculator.calculate(0), 100);
      expect(calculator.calculate(2), 94);
      expect(calculator.calculate(-2), 98);
    });
  });

  group('Widget tests', () {
    testWidgets('Should display specific text', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.text("< KN-31>: <Yulia>'s last Flutter App"), findsOneWidget);
    });

    testWidgets('Should have FloatingActionButton with icon', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.pets), findsOneWidget);
    });

    testWidgets('Counter increments by 3', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.text('Counter: 3'), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();


      expect(find.text('Counter: 6'), findsOneWidget);
    });
  });
}
