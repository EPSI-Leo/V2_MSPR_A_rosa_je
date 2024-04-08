import 'package:arosa_je/core/data/repositories/auth/login/login_repository.dart';
import 'package:arosa_je/core/data/repositories/auth/register/register_repository.dart';
import 'package:arosa_je/modules/auth/login/model/auth_alert_message.dart';
import 'package:arosa_je/modules/auth/login/notifier.dart';
import 'package:arosa_je/modules/auth/register/notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common/mocked_classes.dart';

void main() {
  late ProviderContainer container;
  late MockRegisterRepository registerRepository;

  late String username;
  late String password;
  late int cgu;
  setUpAll(() {});

  setUp(() {
    registerRepository = MockRegisterRepository();
    container = ProviderContainer(overrides: [
      registerRepositoryProvider.overrideWithValue(registerRepository),
    ]);
  });

  tearDown(() {
    container.dispose();
  });

  group('RegisterNotifier Tests', () {
    test('registerRepository called', () async {
      username = 'username';
      password = 'password';
      cgu = 1;

      when(() => registerRepository.register(
            username,
            password,
            cgu,
          )).thenAnswer((_) async => true);

      await container.read(registerProvider.notifier).register(
            username,
            password,
            cgu,
          );

      verify(() => registerRepository.register(
            username,
            password,
            cgu,
          )).called(1);
      final result = await container.read(registerProvider.future);

      expect(result, true);
    });

    test('setConnectionMessageError', () {
      container.read(loginFormProvider.notifier).setConnectionMessageError(
            AuthAlertMessage.invalidForm,
          );
      expect(container.read(loginFormProvider).alertMessage,
          AuthAlertMessage.invalidForm);
    });

    test('setUsername not empty', () {
      container.read(loginFormProvider.notifier).setUsername('username');
      expect(container.read(loginFormProvider).username, 'username');
    });

    test('setUsername  empty', () {
      container.read(loginFormProvider.notifier).setUsername('');
      expect(container.read(loginFormProvider).username, '');
    });

    test('setIsButtonActive true', () {
      container.read(loginFormProvider.notifier).setIsButtonActive(true);
      expect(container.read(loginFormProvider).isButtonActive, true);
    });

    test('setIsButtonActive false', () {
      container.read(loginFormProvider.notifier).setIsButtonActive(false);
      expect(container.read(loginFormProvider).isButtonActive, false);
    });

    test('isError true', () {
      container.read(loginFormProvider.notifier).setConnectionMessageError(
            AuthAlertMessage.invalidForm,
          );
      expect(container.read(loginFormProvider.notifier).isError(), true);
    });
    test('isError false', () {
      container.read(loginFormProvider.notifier).setConnectionMessageError(
            AuthAlertMessage.none,
          );
      expect(container.read(loginFormProvider.notifier).isError(), false);
    });
    test('isLoading true', () {
      container.read(loginFormProvider.notifier).setLoading(true);
      expect(container.read(loginFormProvider).isLoading, true);
    });
    test('isLoading false', () {
      container.read(loginFormProvider.notifier).setLoading(false);
      expect(container.read(loginFormProvider).isLoading, false);
    });
    test('isFieldsEmpty true', () {
      container.read(loginFormProvider.notifier).setUsername('username');
      expect(container.read(loginFormProvider).isButtonActive, true);
    });

    test('isFieldsEmpty false', () {
      expect(container.read(loginFormProvider).isButtonActive, false);
    });
  });
}
