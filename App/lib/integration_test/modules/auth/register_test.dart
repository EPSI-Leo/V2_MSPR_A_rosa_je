import 'package:arosa_je/core/l10n/core_localizations.dart'; // Assurez-vous que ce chemin est correct
import 'package:arosa_je/integration_test/robots/robot.dart';
import 'package:arosa_je/modules/auth/register/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('Login Integration Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    late Robot robot;

    testWidgets('Verify register screen elements and registration process',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            localizationsDelegates: [
              CoreLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en', ''), // Ajoutez les locales que vous supportez
              Locale('fr', ''), // Ajoutez les locales que vous supportez
            ],
            home: RegisterView(),
          ),
        ),
      );

      robot = Robot(tester: tester);

      robot.verifyScreen(const Key(RegisterWidgetKeys.scaffoldKey));
      robot.verifyImage(const Key(RegisterWidgetKeys.imageKey));
      robot.verifyText(const Key(RegisterWidgetKeys.titleKey));
      robot.verifyScreen(const Key(RegisterWidgetKeys.usernameFieldKey));
      robot.verifyScreen(const Key(RegisterWidgetKeys.passwordFieldKey));
      robot.verifyScreen(const Key(RegisterWidgetKeys.firstNameFieldKey));
      robot.verifyScreen(const Key(RegisterWidgetKeys.lastNameFieldKey));
      robot.verifyScreen(const Key(RegisterWidgetKeys.emailFieldKey));
      robot.verifyButtonDisabled(
          const Key(RegisterWidgetKeys.registerButtonKey));
      robot.verifyScreen(const Key(RegisterWidgetKeys.loginRowKey));

      //await binding.takeScreenshot('register_screen');

      // Entrez les informations d'inscription
      await robot.enterTextField(
          const Key(RegisterWidgetKeys.usernameFieldKey), 'new_user');
      await tester.pumpAndSettle();

      await robot.enterTextField(
          const Key(RegisterWidgetKeys.passwordFieldKey), 'new_password');
      await tester.pumpAndSettle();

      await robot.enterTextField(
          const Key(RegisterWidgetKeys.firstNameFieldKey), 'John');
      await tester.pumpAndSettle();

      await robot.enterTextField(
          const Key(RegisterWidgetKeys.lastNameFieldKey), 'Doe');
      await tester.pumpAndSettle();

      await robot.enterTextField(
          const Key(RegisterWidgetKeys.emailFieldKey), 'john.doe@example.com');
      await tester.pumpAndSettle();

      robot
          .verifyButtonEnabled(const Key(RegisterWidgetKeys.registerButtonKey));

      await robot.clickButton(const Key(RegisterWidgetKeys.registerButtonKey));
      await tester.pumpAndSettle();

      // TODO: Vérifiez la navigation vers la page de confirmation ou une autre action attendue
      // expect(find.byKey(const Key(ConfirmationWidgetKeys.confirmationScreenKey)), findsOneWidget);
    });
  });
}
