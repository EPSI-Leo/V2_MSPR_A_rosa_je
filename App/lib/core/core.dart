library core;

import 'package:flutter/foundation.dart';

//gap
export 'package:arosa_je/core/theme/app_gap.dart';
//inputs
export 'package:arosa_je/core/widget/inputs/app_date_textformfield.dart';
export 'package:arosa_je/core/widget/inputs/app_textformfield.dart';
//get
export 'package:get/get.dart';

//l10n
export "l10n/l10n.dart";

//theme


printDebug(String message) {
  if (kDebugMode) {
    print(message);
  }
}
