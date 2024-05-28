import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class Robot {
  final WidgetTester tester;

  Robot({required this.tester});

//Screen
  void verifyScreen(keys) {
    final screen = find.byKey(keys);
    expect(screen, findsOneWidget);
  }

//Image

  void verifyImage(keys) {
    final image = find.byKey(keys);
    expect(image, findsOneWidget);
  }

//TextField

  Future<void> enterTextField(keys, text) async {
    final textField = find.byKey(keys);
    await tester.enterText(textField, text);
  }
//Button

  Future<void> clickButton(keys) async {
    final button = find.byKey(keys);
    await tester.tap(button);
    await tester.pumpAndSettle();
  }

  void verifyButtonDisabled(keys) {
    final button = find.byKey(keys);
    final buttonWidget = tester.widget<FilledButton>(button);
    expect(buttonWidget.enabled, false);
  }

  void verifyButtonEnabled(keys) {
    final button = find.byKey(keys);
    final buttonWidget = tester.widget<FilledButton>(button);
    expect(buttonWidget.enabled, true);
  }

//Text

  void verifyText(keys) {
    final textWidget = find.byKey(keys);
    expect(textWidget, findsOneWidget);
  }

  void verifyTextContains(text) {
    expect(find.textContaining(text), findsOneWidget);
  }

//Checkbox

  Future<void> clickCheckbox(keys) async {
    final checkbox = find.byKey(keys);
    await tester.tap(checkbox);
    await tester.pumpAndSettle();
  }

  Future<void> verifyCheckboxTransition(keys) async {
    final checkbox = find.byKey(keys);

    // Vérifie l'état initial
    final initialCheckboxWidget = tester.widget<Checkbox>(checkbox);
    expect(initialCheckboxWidget.value, false);

    await tester.tap(checkbox);
    await tester.pumpAndSettle();

    // Utilise l'instruction await pour tester.widget également
    final finalCheckboxWidget = tester.widget<Checkbox>(checkbox);
    expect(finalCheckboxWidget.value, true);
  }
}
