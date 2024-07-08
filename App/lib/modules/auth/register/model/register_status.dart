import 'package:arosa_je/modules/auth/register/model/auth_alert_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_status.freezed.dart';

@freezed
class RegisterStatus with _$RegisterStatus {
  factory RegisterStatus({
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String username,
    @Default('') String password,
    @Default('') String email,
    @Default(AuthAlertMessage.none) AuthAlertMessage alertMessage,
    @Default(false) bool isEmailError,
    @Default(false) bool isButtonActive,
    @Default(false) bool isLoading,
    @Default(false) bool isPasswordError,
  }) = _RegisterStatus;
}
