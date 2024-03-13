import 'dart:io';

import 'package:arosa_je/core/api_client_exception.dart';
import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/core/theme/app_spacing.dart';
import 'package:arosa_je/modules/auth/login/model/auth_alert_message.dart';
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
  final _register = TextEditingController();

  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _register.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spacings = ref.read(spacingThemeProvider);
    final coreL10n = context.coreL10n;
    final registerForm = ref.watch(registerFormProvider);
    ref.read(registerProvider);

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
                  const AppGap.xxl(),
                  const AppGap.xs(),
                  TextFormField(
                    controller: _register,
                    onChanged: (value) {
                      ref
                          .read(registerFormProvider.notifier)
                          .setUsername(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: coreL10n.signinUsername,
                      labelStyle: const TextStyle(color: Colors.black),
                      hintText: coreL10n.signinUsernameSentence,
                    ),
                  ),
                  const AppGap.small(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacings.xs),
                    child: SizedBox(
                      width: double.infinity,
                      height: spacings.large,
                      child: FilledButton(
                        style: ButtonStyle(
                          backgroundColor: registerForm.isButtonActive
                              ? MaterialStateProperty.all(Colors.green)
                              : null,
                        ),
                        onPressed: registerForm.isButtonActive
                            ? () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  ref
                                      .read(registerProvider.notifier)
                                      .register(_register.text);
                                }
                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                            : null,
                        child: Text(
                          coreL10n.signup,
                          style: registerForm.isButtonActive
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
