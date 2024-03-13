// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginHash() => r'89d200ab7221c374c23e41bc1d72491c400a1194';

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
String _$loginFormHash() => r'1c77c6a7bb0d3056a137c0c0ebc9b82f668df7e8';

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
