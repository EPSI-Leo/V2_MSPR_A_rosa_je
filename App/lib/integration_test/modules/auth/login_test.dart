import 'package:arosa_je/core/l10n/core_localizations.dart'; // Assurez-vous que ce chemin est correct
import 'package:arosa_je/integration_test/robots/robot.dart';
import 'package:arosa_je/modules/auth/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('Login Integration Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    late Robot robot;

    testWidgets('Verify login screen elements and login process',
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
            home: LoginView(),
          ),
        ),
      );

      robot = Robot(tester: tester);

      robot.verifyScreen(const Key(LoginWidgetKeys.scaffoldKey));
      robot.verifyImage(const Key(LoginWidgetKeys.imageKey));
      robot.verifyText(const Key(LoginWidgetKeys.titleKey));
      robot.verifyText(const Key(LoginWidgetKeys.sentenceKey));
      robot.verifyScreen(const Key(LoginWidgetKeys.usernameFieldKey));
      robot.verifyScreen(const Key(LoginWidgetKeys.passwordFieldKey));
      robot.verifyButtonDisabled(const Key(LoginWidgetKeys.loginButtonKey));
      robot.verifyScreen(const Key(LoginWidgetKeys.registerRowKey));

      //await binding.takeScreenshot('login_screen');

      // Entrez le nom d'utilisateur
      await robot.enterTextField(
          const Key(LoginWidgetKeys.usernameFieldKey), 'correct_user');
      await tester.pumpAndSettle();

      // Entrez le mot de passe
      await robot.enterTextField(
          const Key(LoginWidgetKeys.passwordFieldKey), 'correct_password');
      await tester.pumpAndSettle();

      robot.verifyButtonEnabled(const Key(LoginWidgetKeys.loginButtonKey));

      await robot.clickButton(const Key(LoginWidgetKeys.loginButtonKey));
      await tester.pumpAndSettle();

      // TODO: Vérifiez la navigation vers la page d'accueil ou une autre action attendue
      // expect(find.byKey(const Key(HomeWidgetKeys.homeScreenKey)), findsOneWidget);
    });

    /* testWidgets('Login with incorrect credentials shows error',
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
              Locale('en', ''),
              Locale('fr', ''),
            ],
            home: LoginView(),
          ),
        ),
      );

      robot = Robot(tester: tester);

      await robot.enterTextField(
          const Key(LoginWidgetKeys.usernameFieldKey), 'wrong_user');
      await robot.enterTextField(
          const Key(LoginWidgetKeys.passwordFieldKey), 'wrong_password');
      //await robot.clickButton(const Key(LoginWidgetKeys.loginButtonKey));

      robot.verifyTextContains(
          'Invalid username or password'); // Assurez-vous que ce message d'erreur est correct
    }); */
  });
}
