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
  ) async {
    state = const AsyncLoading();
    ref.read(registerFormProvider.notifier).setConnectionMessageError(
          AuthAlertMessage.none,
        );
    final registerRepository = ref.read(registerRepositoryProvider);
    state = await AsyncValue.guard(() => registerRepository.register(
          username,
          password,
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

  void setUsername(String username) {
    state = state.copyWith(
      username: username,
    );

    isFieldsEmpty();
  }

  void setPassword(String password) {
    state = state.copyWith(
      password: password,
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
    setIsButtonActive(state.username.isNotEmpty);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
