// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginHash() => r'adb3bd05dc01c9100bb910a5d683c99f82bb822f';

/// See also [Login].
@ProviderFor(Login)
final loginProvider = AutoDisposeAsyncNotifierProvider<Login, bool>.internal(
  Login.new,
  name: r'loginProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Login = AutoDisposeAsyncNotifier<bool>;
String _$loginFormHash() => r'd5453dd279ef98cf9879eca44b5a441270a66dd1';

/// See also [LoginForm].
@ProviderFor(LoginForm)
final loginFormProvider =
    AutoDisposeNotifierProvider<LoginForm, AuthStatus>.internal(
  LoginForm.new,
  name: r'loginFormProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginFormHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginForm = AutoDisposeNotifier<AuthStatus>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
