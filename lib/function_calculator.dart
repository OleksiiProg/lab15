import 'main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
class FunctionCalculator {
  double calculate(double x) {
    return 12 - x / 3 + x * x; // Формула для варіанту 8
  }
}


// Тести
void runTests() {
  group('FunctionCalculator Tests', () {
    final calculator = FunctionCalculator();

    test('Calculation of y = 12 - x / 3 + x^2', () {
      expect(calculator.calculate(0), 12); // y = 12
      expect(calculator.calculate(3), 12 + 9 - 1); // y = 12 - 1 + 9
      expect(calculator.calculate(-1), 12 - (-1 / 3) + 1); // y = 12 + 1/3 + 1
    });
  });

  group('UI Tests', () {
    testWidgets(
        'Checks if the text `<Group>: <Name>\'s last Flutter App` is present',
            (WidgetTester tester) async {
          await tester.pumpWidget( MyApp());

          expect(find.text("AV-31: Lev's last Flutter App"), findsOneWidget);
        });

    testWidgets('Checks FloatingActionButton with the correct icon',
            (WidgetTester tester) async {
          await tester.pumpWidget(MyApp());

          // Очікується іконка `Icons.mouse`
          final fab = find.byType(FloatingActionButton);
          expect(fab, findsOneWidget);
          expect(
            (tester.firstWidget(fab) as FloatingActionButton).child,
            const Icon(Icons.camera_alt_outlined),
          );
        });

    testWidgets('Checks counter increment works correctly',
            (WidgetTester tester) async {
          await tester.pumpWidget( MyApp());

          // Знаходимо текст лічильника
          final counterTextFinder = find.byKey(Key('counterText'));
          expect(counterTextFinder, findsOneWidget);

          // Перевіряємо початкове значення
          expect(find.text('0'), findsOneWidget);

          // Натискаємо FAB
          await tester.tap(find.byType(FloatingActionButton));
          await tester.pump();

          // Перевіряємо нове значення
          expect(find.text('1'), findsOneWidget);
        });
  });
}
