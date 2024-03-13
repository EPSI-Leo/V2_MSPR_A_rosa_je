import 'package:flutter/widgets.dart';
import 'package:arosa_je/core/l10n/core_localizations.dart';

export 'package:arosa_je/core/l10n/core_localizations.dart';

extension CoreLocalizeExtensions on BuildContext {
  CoreLocalizations get coreL10n => CoreLocalizations.of(this)!;
}
