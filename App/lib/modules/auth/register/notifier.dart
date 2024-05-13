import 'package:arosa_je/core/data/repositories/auth/register/register_repository.dart';
import 'package:arosa_je/modules/auth/login/model/auth_alert_message.dart';
import 'package:arosa_je/modules/auth/login/model/auth_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

@Riverpod(keepAlive: false)
class Register extends _$Register {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> register(
    String username,
    String password,
    String firstName,
    String lastName,
    String email,
  ) async {
    state = const AsyncLoading();
    ref.read(registerFormProvider.notifier).setConnectionMessageError(
          AuthAlertMessage.none,
        );
    final registerRepository = ref.read(registerRepositoryProvider);
    state = await AsyncValue.guard(() => registerRepository.register(
          username,
          password,
          firstName,
          lastName,
          email,
        ));
  }
}

@Riverpod(keepAlive: false)
class RegisterForm extends _$RegisterForm {
  @override
  AuthStatus build() {
    return AuthStatus();
  }

  void setConnectionMessageError(
    AuthAlertMessage alertMessage,
  ) {
    state = state.copyWith(
      alertMessage: alertMessage,
    );
  }

  void setFirstName(String firstName) {
    state = state.copyWith(
      firstName: firstName,
    );

    isFieldsEmpty();
  }

  void setLastName(String lastName) {
    state = state.copyWith(
      lastName: lastName,
    );

    isFieldsEmpty();
  }

  void setUsername(String username) {
    state = state.copyWith(
      username: username,
    );
  }

  void setPassword(String passsword) {
    state = state.copyWith(
      password: passsword,
    );

    isFieldsEmpty();
  }

  void setEmail(String email) {
    state = state.copyWith(
      email: email,
    );

    isFieldsEmpty();
    isValidEmail(email);
  }

  void setIsButtonActive(bool isActive) {
    state = state.copyWith(
      isButtonActive: isActive,
    );
  }

  bool isError() {
    return state.alertMessage != AuthAlertMessage.none;
  }

  void isFieldsEmpty() {
    setIsButtonActive(
      state.firstName.isNotEmpty &&
          state.lastName.isNotEmpty &&
          state.username.isNotEmpty &&
          state.password.isNotEmpty &&
          state.email.isNotEmpty &&
          !state.isEmailError,
    );
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void isValidEmail(String email) {
    final isEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

    if (isEmail) {
      state = state.copyWith(
        email: email,
        isEmailError: false,
      );
    } else {
      state = state.copyWith(
        email: email,
        isEmailError: true,
      );
    }
  }
}
