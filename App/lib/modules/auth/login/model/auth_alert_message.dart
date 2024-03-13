import 'package:arosa_je/core/core.dart';

enum AuthAlertMessage {
  none,
  invalidForm,
  alertMessageValidationCode,
}

extension TextStyleExtension on AuthAlertMessage {
  String getErrorMessage({
    required CoreLocalizations localizations,
  }) {
    late String errorMessage;
    switch (this) {
      case AuthAlertMessage.invalidForm:
        errorMessage = localizations.signinIncorrect;
      case AuthAlertMessage.alertMessageValidationCode:
        errorMessage = localizations.invalidCode;
      default:
        errorMessage = "Unknown";
    }
    return errorMessage;
  }
}
