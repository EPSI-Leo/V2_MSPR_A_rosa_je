import 'package:arosa_je/core/core.dart';

enum AuthAlertMessage {
  none,
  invalidForm,
  usernameAlreadyExist,
}

extension TextStyleExtension on AuthAlertMessage {
  String getErrorMessage({
    required CoreLocalizations localizations,
  }) {
    late String errorMessage;
    switch (this) {
      case AuthAlertMessage.invalidForm:
        errorMessage = localizations.signinIncorrect;
        break;
      default:
        errorMessage = "Unknown";
    }
    return errorMessage;
  }
}
