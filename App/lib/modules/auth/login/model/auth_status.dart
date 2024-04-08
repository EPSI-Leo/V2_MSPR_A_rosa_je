import 'package:arosa_je/modules/auth/login/model/auth_alert_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_status.freezed.dart';

@freezed
class AuthStatus with _$AuthStatus {
  factory AuthStatus({
    @Default('') String username,
    @Default('') String password,
    @Default(0) int cgu,
    @Default(AuthAlertMessage.none) AuthAlertMessage alertMessage,
    @Default(false) bool isButtonActive,
    @Default(false) bool isLoading,
  }) = _AuthStatus;
}
