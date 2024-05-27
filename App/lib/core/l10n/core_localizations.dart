import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'core_localizations_en.dart';
import 'core_localizations_fr.dart';

/// Callers can lookup localized strings with an instance of CoreLocalizations
/// returned by `CoreLocalizations.of(context)`.
///
/// Applications need to include `CoreLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/core_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CoreLocalizations.localizationsDelegates,
///   supportedLocales: CoreLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the CoreLocalizations.supportedLocales
/// property.
abstract class CoreLocalizations {
  CoreLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CoreLocalizations? of(BuildContext context) {
    return Localizations.of<CoreLocalizations>(context, CoreLocalizations);
  }

  static const LocalizationsDelegate<CoreLocalizations> delegate = _CoreLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @validateText.
  ///
  /// In en, this message translates to:
  /// **'Please complete this field'**
  String get validateText;

  /// No description provided for @signinTitle1.
  ///
  /// In en, this message translates to:
  /// **'WELCOME'**
  String get signinTitle1;

  /// No description provided for @signinSentence1.
  ///
  /// In en, this message translates to:
  /// **'Please login to continue'**
  String get signinSentence1;

  /// No description provided for @signinUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get signinUsername;

  /// No description provided for @signinUsernameSentence.
  ///
  /// In en, this message translates to:
  /// **'Enter your username'**
  String get signinUsernameSentence;

  /// No description provided for @signinPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signinPassword;

  /// No description provided for @signinPasswordSentence.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get signinPasswordSentence;

  /// No description provided for @signinRememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get signinRememberMe;

  /// No description provided for @signinForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password ?'**
  String get signinForgotPassword;

  /// No description provided for @signin.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signin;

  /// No description provided for @signinContinueWith.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get signinContinueWith;

  /// No description provided for @signinGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signinGoogle;

  /// No description provided for @signinDontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Not registered ?'**
  String get signinDontHaveAccount;

  /// No description provided for @signinAlreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account ?'**
  String get signinAlreadyHaveAccount;

  /// No description provided for @signinLoginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login Successful'**
  String get signinLoginSuccess;

  /// No description provided for @signinIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Username or password invalid'**
  String get signinIncorrect;

  /// No description provided for @signupTitle.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get signupTitle;

  /// No description provided for @signupEnterText.
  ///
  /// In en, this message translates to:
  /// **'Please enter some text'**
  String get signupEnterText;

  /// No description provided for @signupFirstName.
  ///
  /// In en, this message translates to:
  /// **'FirstName'**
  String get signupFirstName;

  /// No description provided for @signupFirstNameSentence.
  ///
  /// In en, this message translates to:
  /// **'Enter your first name'**
  String get signupFirstNameSentence;

  /// No description provided for @signupLastName.
  ///
  /// In en, this message translates to:
  /// **'LastName'**
  String get signupLastName;

  /// No description provided for @signupLastNameSentence.
  ///
  /// In en, this message translates to:
  /// **'Enter your last name'**
  String get signupLastNameSentence;

  /// No description provided for @signupEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get signupEmail;

  /// No description provided for @signupEmailSentence.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get signupEmailSentence;

  /// No description provided for @validateEmailValid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get validateEmailValid;

  /// No description provided for @signupPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get signupPhone;

  /// No description provided for @signupPhoneSentence.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get signupPhoneSentence;

  /// No description provided for @signupAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get signupAddress;

  /// No description provided for @signupAddressSentence.
  ///
  /// In en, this message translates to:
  /// **'Enter your address'**
  String get signupAddressSentence;

  /// No description provided for @signupCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get signupCity;

  /// No description provided for @signupCitySentence.
  ///
  /// In en, this message translates to:
  /// **'Enter your city'**
  String get signupCitySentence;

  /// No description provided for @signupPostalCode.
  ///
  /// In en, this message translates to:
  /// **'Postal code'**
  String get signupPostalCode;

  /// No description provided for @signupPostalCodeSentence.
  ///
  /// In en, this message translates to:
  /// **'Enter your postal code'**
  String get signupPostalCodeSentence;

  /// No description provided for @signupTermsOfuse.
  ///
  /// In en, this message translates to:
  /// **'I accept the conditions of use'**
  String get signupTermsOfuse;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signup;

  /// No description provided for @signupGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get signupGoogle;

  /// No description provided for @signupHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account ?'**
  String get signupHaveAccount;

  /// No description provided for @signupUserExist.
  ///
  /// In en, this message translates to:
  /// **'User already exit!'**
  String get signupUserExist;

  /// No description provided for @signupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Registration Successful'**
  String get signupSuccess;

  /// No description provided for @signupOpenTermsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Please read Terms of uses'**
  String get signupOpenTermsOfUse;

  /// No description provided for @homeButton.
  ///
  /// In en, this message translates to:
  /// **'Add plant'**
  String get homeButton;

  /// No description provided for @feedbackType.
  ///
  /// In en, this message translates to:
  /// **'Feedback type'**
  String get feedbackType;

  /// No description provided for @feedbackReportBug.
  ///
  /// In en, this message translates to:
  /// **'Report a problem'**
  String get feedbackReportBug;

  /// No description provided for @feedbackSuggestion.
  ///
  /// In en, this message translates to:
  /// **'Suggest an improvement'**
  String get feedbackSuggestion;

  /// No description provided for @feedbackQuestion.
  ///
  /// In en, this message translates to:
  /// **'Ask a question'**
  String get feedbackQuestion;

  /// No description provided for @feedbackDescription.
  ///
  /// In en, this message translates to:
  /// **'Write your feedback'**
  String get feedbackDescription;

  /// No description provided for @feedbackButton.
  ///
  /// In en, this message translates to:
  /// **'Send feedback'**
  String get feedbackButton;

  /// No description provided for @dateStart.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get dateStart;

  /// No description provided for @dateStartSentence.
  ///
  /// In en, this message translates to:
  /// **'Enter start date'**
  String get dateStartSentence;

  /// No description provided for @dateEnd.
  ///
  /// In en, this message translates to:
  /// **'End date'**
  String get dateEnd;

  /// No description provided for @dateEndSentence.
  ///
  /// In en, this message translates to:
  /// **'Enter end date'**
  String get dateEndSentence;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Desciption'**
  String get description;

  /// No description provided for @descriptionSentence.
  ///
  /// In en, this message translates to:
  /// **'Enter a desciption'**
  String get descriptionSentence;

  /// No description provided for @registerPlant.
  ///
  /// In en, this message translates to:
  /// **'Register my plant'**
  String get registerPlant;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Commentaire'**
  String get feedback;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageSentence.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get settingsLanguageSentence;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete my account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountSentence.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account ?'**
  String get deleteAccountSentence;

  /// No description provided for @disconnect.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get disconnect;

  /// No description provided for @me.
  ///
  /// In en, this message translates to:
  /// **'me'**
  String get me;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @validate.
  ///
  /// In en, this message translates to:
  /// **'Validate'**
  String get validate;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get confirmation;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @refuse.
  ///
  /// In en, this message translates to:
  /// **'Refuse'**
  String get refuse;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @continues.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continues;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @advices.
  ///
  /// In en, this message translates to:
  /// **'Advices'**
  String get advices;

  /// No description provided for @myPlants.
  ///
  /// In en, this message translates to:
  /// **'My plants'**
  String get myPlants;

  /// No description provided for @invalidCode.
  ///
  /// In en, this message translates to:
  /// **'Username invalid'**
  String get invalidCode;

  /// No description provided for @plantName.
  ///
  /// In en, this message translates to:
  /// **'Plant name'**
  String get plantName;

  /// No description provided for @careAdvice.
  ///
  /// In en, this message translates to:
  /// **'Care Advice'**
  String get careAdvice;

  /// No description provided for @addAdvice.
  ///
  /// In en, this message translates to:
  /// **'Add advice'**
  String get addAdvice;

  /// No description provided for @plantInfosSentence.
  ///
  /// In en, this message translates to:
  /// **'Plant information'**
  String get plantInfosSentence;
}

class _CoreLocalizationsDelegate extends LocalizationsDelegate<CoreLocalizations> {
  const _CoreLocalizationsDelegate();

  @override
  Future<CoreLocalizations> load(Locale locale) {
    return SynchronousFuture<CoreLocalizations>(lookupCoreLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_CoreLocalizationsDelegate old) => false;
}

CoreLocalizations lookupCoreLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return CoreLocalizationsEn();
    case 'fr': return CoreLocalizationsFr();
  }

  throw FlutterError(
    'CoreLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
