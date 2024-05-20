import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config.g.dart';

@Riverpod(keepAlive: true)
Config config(ConfigRef ref) {
  throw UnimplementedError();
}

/// Configuration for an application.
@immutable
abstract class Config {
  const Config();

  // Create your env factories here.
  // Edit if flavors name is differente
  factory Config.preprod() => _PreprodConfig();
  factory Config.prod() => _ProdConfig();

  /// Example of common property.
  String get baseUrl;
}

// Create your env configs here or in a separate file for each env.

class _PreprodConfig implements Config {
  @override
  String get baseUrl => 'http://10.0.2.2:7181';
}

class _ProdConfig implements Config {
  @override
  String get baseUrl => 'http://10.0.2.2:7181';
}
