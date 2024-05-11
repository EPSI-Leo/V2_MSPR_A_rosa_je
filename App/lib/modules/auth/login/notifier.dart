import 'package:arosa_je/core/data/repositories/auth/login/login_repository.dart';
import 'package:arosa_je/modules/auth/login/model/auth_alert_message.dart';
import 'package:arosa_je/modules/auth/login/model/auth_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

@Riverpod(keepAlive: false)
class Login extends _$Login {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> login(
    String username,
    String password,
  ) async {
    state = const AsyncLoading();
    ref.read(loginFormProvider.notifier).setConnectionMessageError(
          AuthAlertMessage.none,
        );
    final loginRepository = ref.read(loginRepositoryProvider);
    state = await AsyncValue.guard(() => loginRepository.login(
          username,
          password,
        ));
  }
}

@Riverpod(keepAlive: false)
class LoginForm extends _$LoginForm {
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

  void setPassword(String passsword) {
    state = state.copyWith(
      password: passsword,
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
    setIsButtonActive(state.username.isNotEmpty && state.password.isNotEmpty);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
