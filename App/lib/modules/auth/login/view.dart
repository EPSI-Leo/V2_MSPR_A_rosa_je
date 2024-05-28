import 'dart:io';

import 'package:arosa_je/core/api_client_exception.dart';
import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/core/theme/app_spacing.dart';
import 'package:arosa_je/modules/auth/login/model/auth_alert_message.dart';
import 'package:arosa_je/modules/auth/login/notifier.dart';
import 'package:arosa_je/router/router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final TextEditingController _login = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    obscureText = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spacings = ref.read(spacingThemeProvider);
    final coreL10n = context.coreL10n;
    final loginForm = ref.watch(loginFormProvider);

    ref.listen(loginProvider, (_, next) {
      next.when(
        data: (isAuthenticated) {
          if (isAuthenticated) {
            context.goNamed(AppRoute.home.name);
            ref.read(loginFormProvider.notifier).setLoading(false);
          }
        },
        error: (error, stackTrace) {
          if (error is ApiClientException) {
            if (error.code == HttpStatus.forbidden ||
                error.code == HttpStatus.badRequest ||
                error.code == HttpStatus.notFound) {
              ref.read(loginFormProvider.notifier).setConnectionMessageError(
                    AuthAlertMessage.invalidForm,
                  );
            }
          }
          ref.read(loginFormProvider.notifier).setLoading(false);
        },
        loading: () {
          ref.read(loginFormProvider.notifier).setLoading(true);
        },
      );
    });

    return Scaffold(
      key: const Key(LoginWidgetKeys.scaffoldKey),
      body: Center(
        child: SingleChildScrollView(
          key: const Key(LoginWidgetKeys.scrollViewKey),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: spacings.small),
            child: Form(
              key: _formKey,
              child: Column(
                key: const Key(LoginWidgetKeys.columnKey),
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    key: Key(LoginWidgetKeys.imageKey),
                    image: AssetImage('assets/images/icon.png'),
                  ),
                  Text(
                    coreL10n.signinTitle1,
                    key: const Key(LoginWidgetKeys.titleKey),
                    style: const TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    coreL10n.signinSentence1,
                    key: const Key(LoginWidgetKeys.sentenceKey),
                  ),
                  const AppGap.xs(),
                  TextFormField(
                    key: const Key(LoginWidgetKeys.usernameFieldKey),
                    decoration: InputDecoration(
                      hintText: coreL10n.signupEmail,
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
                      errorText: ref.watch(loginFormProvider).isEmailError
                          ? coreL10n.validateEmailValid
                          : null,
                    ),
                    controller: _login,
                    onChanged: (value) {
                      final isEmail =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value);
                      ref.read(loginFormProvider.notifier).setEmail(value);
                      ref
                          .read(loginFormProvider.notifier)
                          .setIsEmailError(!isEmail);
                      ref.read(loginFormProvider.notifier).isFieldsEmpty();
                    },
                  ),
                  const AppGap.xs(),
                  TextFormField(
                    key: const Key(LoginWidgetKeys.passwordFieldKey),
                    decoration: InputDecoration(
                      hintText: coreL10n.signinPassword,
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
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
                      ref.read(loginFormProvider.notifier).setPassword(value);
                    },
                  ),
                  const AppGap.small(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacings.xs),
                    child: SizedBox(
                      width: double.infinity,
                      height: spacings.large,
                      child: FilledButton(
                        key: const Key(LoginWidgetKeys.loginButtonKey),
                        style: ButtonStyle(
                          backgroundColor: loginForm.isButtonActive
                              ? WidgetStateProperty.all(Colors.green)
                              : null,
                        ),
                        onPressed: loginForm.isButtonActive
                            ? () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  ref
                                      .read(loginProvider.notifier)
                                      .login(_login.text, _password.text);
                                  try {
                                    UserCredential userCredential =
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                      email: _login.text,
                                      password: _password.text,
                                    );
                                    final FirebaseFirestore _firestore =
                                        FirebaseFirestore.instance;

                                    _firestore
                                        .collection('users')
                                        .doc(userCredential.user!.uid)
                                        .set({
                                      'email': userCredential.user!.email,
                                      'uid': userCredential.user!.uid,
                                    }, SetOptions(merge: true));
                                  } on FirebaseAuthException catch (e) {
                                    printDebug(e.toString());
                                    //TODO make the connection to firebase properly in notifier
                                  }
                                }

                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                            : null,
                        child: Text(
                          coreL10n.signin,
                          style: loginForm.isButtonActive
                              ? const TextStyle(color: Colors.white)
                              : null,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    key: const Key(LoginWidgetKeys.registerRowKey),
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        coreL10n.signinDontHaveAccount,
                        key: const Key(LoginWidgetKeys.noAccountTextKey),
                      ),
                      TextButton(
                        key: const Key(LoginWidgetKeys.signupButtonKey),
                        child: Text(
                          coreL10n.signup,
                          style: const TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          context.goNamed(AppRoute.register.name);
                        },
                      )
                    ],
                  ),
                  if (ref.read(loginFormProvider.notifier).isError())
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppDimensions.large + AppDimensions.tiny),
                      child: Center(
                        child: Text(
                          ref
                              .read(loginFormProvider)
                              .alertMessage
                              .getErrorMessage(
                                localizations: coreL10n,
                              ),
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  if (loginForm.isLoading)
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: AppDimensions.xxLarge),
                      child: Center(
                        child: CircularProgressIndicator(
                          key: Key(LoginWidgetKeys.loadingIndicatorKey),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginWidgetKeys {
  static const String scaffoldKey = 'scaffold_key';
  static const String scrollViewKey = 'scroll_view_key';
  static const String columnKey = 'column_key';
  static const String imageKey = 'image_key';
  static const String titleKey = 'title_key';
  static const String sentenceKey = 'sentence_key';
  static const String usernameFieldKey = 'username_field_key';
  static const String passwordFieldKey = 'password_field_key';
  static const String loginButtonKey = 'login_button_key';
  static const String registerRowKey = 'register_row_key';
  static const String noAccountTextKey = 'no_account_text_key';
  static const String signupButtonKey = 'signup_button_key';
  static const String loadingIndicatorKey = 'loading_indicator_key';
}
