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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: spacings.small),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(image: AssetImage('lib/assets/images/icon.png')),
                  Text(
                    coreL10n.signupTitle,
                    style: const TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
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
                      ref
                          .read(registerFormProvider.notifier)
                          .setPassword(value);
                      ref.read(registerFormProvider.notifier).isFieldsEmpty();
                    },
                  ),
                  const AppGap.xs(),
                  TextFormField(
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
                        style: ButtonStyle(
                          backgroundColor: isButtonActive
                              ? MaterialStateProperty.all(Colors.green)
                              : null,
                        ),
                        onPressed: isButtonActive
                            ? () {
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
                    // ignore: sort_child_properties_last
                    children: <Widget>[
                      Text(
                        coreL10n.signinDontHaveAccount,
                      ),
                      TextButton(
                        child: Text(
                          coreL10n.signin,
                          style: const TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          context.goNamed(AppRoute.login.name);
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
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
