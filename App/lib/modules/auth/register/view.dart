import 'dart:io';

import 'package:arosa_je/core/api_client_exception.dart';
import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/core/theme/app_spacing.dart';
import 'package:arosa_je/modules/auth/register/model/auth_alert_message.dart';
import 'package:arosa_je/modules/auth/register/notifier.dart';
import 'package:arosa_je/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spacings = ref.read(spacingThemeProvider);
    final coreL10n = context.coreL10n;

    final isButtonActive =
        ref.watch(registerFormProvider.select((state) => state.isButtonActive));

    ref.listen(registerProvider, (_, next) {
      next.when(
        data: (isAuthenticated) {
          if (isAuthenticated) {
            context.goNamed(AppRoute.login.name);
            ref.read(registerFormProvider.notifier).setLoading(false);
          }
        },
        error: (error, stackTrace) {
          if (error is ApiClientException) {
            if (error.code == HttpStatus.forbidden ||
                error.code == HttpStatus.badRequest ||
                error.code == HttpStatus.notFound) {
              ref.read(registerFormProvider.notifier).setConnectionMessageError(
                    AuthAlertMessage.invalidForm,
                  );
            }
          }
          ref.read(registerFormProvider.notifier).setLoading(false);
        },
        loading: () {
          ref.read(registerFormProvider.notifier).setLoading(true);
        },
      );
    });

    return Scaffold(
      key: const Key(RegisterWidgetKeys.scaffoldKey),
      body: Center(
        child: SingleChildScrollView(
          key: const Key(RegisterWidgetKeys.scrollViewKey),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: spacings.small),
            child: Form(
              key: _formKey,
              child: Column(
                key: const Key(RegisterWidgetKeys.columnKey),
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    key: Key(RegisterWidgetKeys.imageKey),
                    image: AssetImage('assets/images/icon.png'),
                  ),
                  Text(
                    coreL10n.signupTitle,
                    key: const Key(RegisterWidgetKeys.titleKey),
                    style: const TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    key: const Key(RegisterWidgetKeys.usernameFieldKey),
                    decoration: InputDecoration(
                      hintText: coreL10n.signinUsername,
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                    controller: _username,
                    onChanged: (value) {
                      ref
                          .read(registerFormProvider.notifier)
                          .setUsername(value);
                      ref.read(registerFormProvider.notifier).isFieldsEmpty();
                    },
                  ),
                  const AppGap.xs(),
                  TextFormField(
                    key: const Key(RegisterWidgetKeys.passwordFieldKey),
                    decoration: InputDecoration(
                      hintText: coreL10n.signinPassword,
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
                      errorText: ref.watch(registerFormProvider).isPasswordError
                          ? "Mot de passe invalide, minimum 6 caractères"
                          : null,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.grey300,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      ),
                    ),
                    obscureText: obscureText,
                    controller: _password,
                    onChanged: (value) {
                      ref
                          .read(registerFormProvider.notifier)
                          .setPassword(value);
                      ref.read(registerFormProvider.notifier).isFieldsEmpty();
                    },
                  ),
                  const AppGap.xs(),
                  TextFormField(
                    key: const Key(RegisterWidgetKeys.firstNameFieldKey),
                    decoration: InputDecoration(
                      hintText: coreL10n.signupFirstName,
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                    controller: _firstName,
                    onChanged: (value) {
                      ref
                          .read(registerFormProvider.notifier)
                          .setFirstName(value);
                      ref.read(registerFormProvider.notifier).isFieldsEmpty();
                    },
                  ),
                  const AppGap.xs(),
                  TextFormField(
                    key: const Key(RegisterWidgetKeys.lastNameFieldKey),
                    decoration: InputDecoration(
                      hintText: coreL10n.signupLastName,
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                    controller: _lastName,
                    onChanged: (value) {
                      ref
                          .read(registerFormProvider.notifier)
                          .setLastName(value);
                      ref.read(registerFormProvider.notifier).isFieldsEmpty();
                    },
                  ),
                  const AppGap.xs(),
                  TextFormField(
                    key: const Key(RegisterWidgetKeys.emailFieldKey),
                    decoration: InputDecoration(
                      hintText: coreL10n.signupEmail,
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
                      errorText: ref.watch(registerFormProvider).isEmailError
                          ? coreL10n.validateEmailValid
                          : null,
                    ),
                    controller: _email,
                    onChanged: (value) {
                      final isEmail =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value);
                      ref.read(registerFormProvider.notifier).setEmail(value);
                      ref
                          .read(registerFormProvider.notifier)
                          .setIsEmailError(!isEmail);
                      ref.read(registerFormProvider.notifier).isFieldsEmpty();
                    },
                  ),
                  const AppGap.small(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacings.xs),
                    child: SizedBox(
                      width: double.infinity,
                      height: spacings.large,
                      child: FilledButton(
                        key: const Key(RegisterWidgetKeys.registerButtonKey),
                        style: ButtonStyle(
                          backgroundColor: isButtonActive
                              ? WidgetStateProperty.all(Colors.green)
                              : null,
                        ),
                        onPressed: isButtonActive
                            ? () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  context.goNamed(AppRoute.cgu.name,
                                      pathParameters: {
                                        'username': _username.text,
                                        'password': _password.text,
                                        'firstName': _firstName.text,
                                        'lastName': _lastName.text,
                                        'email': _email.text,
                                      });
                                }
                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                            : null,
                        child: Text(
                          coreL10n.signup,
                          style: isButtonActive
                              ? const TextStyle(color: Colors.white)
                              : null,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    key: const Key(RegisterWidgetKeys.loginRowKey),
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        coreL10n.signinAlreadyHaveAccount,
                        key: const Key(RegisterWidgetKeys.noAccountTextKey),
                      ),
                      TextButton(
                        key: const Key(RegisterWidgetKeys.loginButtonKey),
                        child: Text(
                          coreL10n.signin,
                          style: const TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          context.goNamed(AppRoute.login.name);
                        },
                      )
                    ],
                  ),
                  const AppGap.xxl()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterWidgetKeys {
  static const String scaffoldKey = 'scaffold_key';
  static const String scrollViewKey = 'scroll_view_key';
  static const String columnKey = 'column_key';
  static const String imageKey = 'image_key';
  static const String titleKey = 'title_key';
  static const String usernameFieldKey = 'username_field_key';
  static const String passwordFieldKey = 'password_field_key';
  static const String firstNameFieldKey = 'first_name_field_key';
  static const String lastNameFieldKey = 'last_name_field_key';
  static const String emailFieldKey = 'email_field_key';
  static const String registerButtonKey = 'register_button_key';
  static const String loginRowKey = 'login_row_key';
  static const String noAccountTextKey = 'no_account_text_key';
  static const String loginButtonKey = 'login_button_key';
}
