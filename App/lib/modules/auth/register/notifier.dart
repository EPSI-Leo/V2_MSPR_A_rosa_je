import 'package:arosa_je/core/data/repositories/auth/register/register_repository.dart';
import 'package:arosa_je/modules/auth/register/model/auth_alert_message.dart';
import 'package:arosa_je/modules/auth/register/model/register_status.dart';
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
    String firebaseUid,
  ) async {
    state = const AsyncLoading();
    ref.read(registerFormProvider.notifier).setConnectionMessageError(
          AuthAlertMessage.none,
        );
    final registerRepository = ref.read(registerRepositoryProvider);
    state = await AsyncValue.guard(() => registerRepository.register(
        username, password, firstName, lastName, email, firebaseUid));
  }
}

@Riverpod(keepAlive: false)
class RegisterForm extends _$RegisterForm {
  @override
  RegisterStatus build() {
    return RegisterStatus();
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

  void setPassword(String password) {
    state = state.copyWith(
      password: password,
      isPasswordError: password.length < 6,
    );

    isFieldsEmpty();
  }

  void setEmail(String email) {
    state = state.copyWith(
      email: email,
    );

    isFieldsEmpty();
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
          !state.isEmailError &&
          !state.isPasswordError,
    );
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setIsEmailError(bool isError) {
    state = state.copyWith(isEmailError: isError);
  }
}
