import 'package:arosa_je/core/data/repositories/auth/register/register_repository.dart';
import 'package:arosa_je/modules/auth/register/model/auth_alert_message.dart';
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
  late String firstName;
  late String lastName;
  late String email;

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
      firstName = 'First';
      lastName = 'Last';
      email = 'email@example.com';

      when(() => registerRepository.register(
            username,
            password,
            firstName,
            lastName,
            email,
          )).thenAnswer((_) async => true);

      await container.read(registerProvider.notifier).register(
            username,
            password,
            firstName,
            lastName,
            email,
          );

      verify(() => registerRepository.register(
            username,
            password,
            firstName,
            lastName,
            email,
          )).called(1);
      final result = await container.read(registerProvider.future);

      expect(result, true);
    });

    test('setConnectionMessageError', () {
      container.read(registerFormProvider.notifier).setConnectionMessageError(
            AuthAlertMessage.invalidForm,
          );
      expect(container.read(registerFormProvider).alertMessage,
          AuthAlertMessage.invalidForm);
    });

    test('setFirstName not empty', () {
      container.read(registerFormProvider.notifier).setFirstName('First');
      expect(container.read(registerFormProvider).firstName, 'First');
    });

    test('setFirstName empty', () {
      container.read(registerFormProvider.notifier).setFirstName('');
      expect(container.read(registerFormProvider).firstName, '');
    });

    test('setLastName not empty', () {
      container.read(registerFormProvider.notifier).setLastName('Last');
      expect(container.read(registerFormProvider).lastName, 'Last');
    });

    test('setLastName empty', () {
      container.read(registerFormProvider.notifier).setLastName('');
      expect(container.read(registerFormProvider).lastName, '');
    });

    test('setUsername not empty', () {
      container.read(registerFormProvider.notifier).setUsername('username');
      expect(container.read(registerFormProvider).username, 'username');
    });

    test('setUsername empty', () {
      container.read(registerFormProvider.notifier).setUsername('');
      expect(container.read(registerFormProvider).username, '');
    });

    test('setPassword not empty', () {
      container.read(registerFormProvider.notifier).setPassword('password');
      expect(container.read(registerFormProvider).password, 'password');
    });

    test('setPassword empty', () {
      container.read(registerFormProvider.notifier).setPassword('');
      expect(container.read(registerFormProvider).password, '');
    });

    test('setEmail not empty', () {
      container
          .read(registerFormProvider.notifier)
          .setEmail('email@example.com');
      expect(container.read(registerFormProvider).email, 'email@example.com');
    });

    test('setEmail empty', () {
      container.read(registerFormProvider.notifier).setEmail('');
      expect(container.read(registerFormProvider).email, '');
    });

    test('setEmail valid email', () {
      container
          .read(registerFormProvider.notifier)
          .setEmail('email@example.com');
      expect(container.read(registerFormProvider).isEmailError, false);
    });

    test('setEmail invalid email', () {
      container.read(registerFormProvider.notifier).setEmail('invalid-email');
      expect(container.read(registerFormProvider).isEmailError, false);
    });

    test('setIsButtonActive true', () {
      container.read(registerFormProvider.notifier).setIsButtonActive(true);
      expect(container.read(registerFormProvider).isButtonActive, true);
    });

    test('setIsButtonActive false', () {
      container.read(registerFormProvider.notifier).setIsButtonActive(false);
      expect(container.read(registerFormProvider).isButtonActive, false);
    });

    test('isError true', () {
      container.read(registerFormProvider.notifier).setConnectionMessageError(
            AuthAlertMessage.invalidForm,
          );
      expect(container.read(registerFormProvider.notifier).isError(), true);
    });

    test('isError false', () {
      container.read(registerFormProvider.notifier).setConnectionMessageError(
            AuthAlertMessage.none,
          );
      expect(container.read(registerFormProvider.notifier).isError(), false);
    });

    test('isLoading true', () {
      container.read(registerFormProvider.notifier).setLoading(true);
      expect(container.read(registerFormProvider).isLoading, true);
    });

    test('isLoading false', () {
      container.read(registerFormProvider.notifier).setLoading(false);
      expect(container.read(registerFormProvider).isLoading, false);
    });

    test('isFieldsEmpty not empty', () {
      container.read(registerFormProvider.notifier).setFirstName('First');
      container.read(registerFormProvider.notifier).setLastName('Last');
      container.read(registerFormProvider.notifier).setUsername('username');
      container.read(registerFormProvider.notifier).setPassword('password');
      container
          .read(registerFormProvider.notifier)
          .setEmail('email@example.com');
      expect(container.read(registerFormProvider).isButtonActive, true);
    });

    test('isFieldsEmpty empty firstName', () {
      container.read(registerFormProvider.notifier).setFirstName('');
      container.read(registerFormProvider.notifier).setLastName('Last');
      container.read(registerFormProvider.notifier).setUsername('username');
      container.read(registerFormProvider.notifier).setPassword('password');
      container
          .read(registerFormProvider.notifier)
          .setEmail('email@example.com');
      expect(container.read(registerFormProvider).isButtonActive, false);
    });

    test('isFieldsEmpty empty lastName', () {
      container.read(registerFormProvider.notifier).setFirstName('First');
      container.read(registerFormProvider.notifier).setLastName('');
      container.read(registerFormProvider.notifier).setUsername('username');
      container.read(registerFormProvider.notifier).setPassword('password');
      container
          .read(registerFormProvider.notifier)
          .setEmail('email@example.com');
      expect(container.read(registerFormProvider).isButtonActive, false);
    });

    test('isFieldsEmpty empty username', () {
      container.read(registerFormProvider.notifier).setFirstName('First');
      container.read(registerFormProvider.notifier).setLastName('Last');
      container.read(registerFormProvider.notifier).setUsername('');
      container.read(registerFormProvider.notifier).setPassword('password');
      container
          .read(registerFormProvider.notifier)
          .setEmail('email@example.com');
      expect(container.read(registerFormProvider).isButtonActive, false);
    });

    test('isFieldsEmpty empty password', () {
      container.read(registerFormProvider.notifier).setFirstName('First');
      container.read(registerFormProvider.notifier).setLastName('Last');
      container.read(registerFormProvider.notifier).setUsername('username');
      container.read(registerFormProvider.notifier).setPassword('');
      container
          .read(registerFormProvider.notifier)
          .setEmail('email@example.com');
      expect(container.read(registerFormProvider).isButtonActive, false);
    });

    test('isFieldsEmpty empty email', () {
      container.read(registerFormProvider.notifier).setFirstName('First');
      container.read(registerFormProvider.notifier).setLastName('Last');
      container.read(registerFormProvider.notifier).setUsername('username');
      container.read(registerFormProvider.notifier).setPassword('password');
      container.read(registerFormProvider.notifier).setEmail('');
      expect(container.read(registerFormProvider).isButtonActive, false);
    });
  });
}
