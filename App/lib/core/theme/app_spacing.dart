import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_spacing.freezed.dart';

/// The AppRadiusTheme of the app.
/// It will be created directly here.
final spacingThemeProvider = Provider<AppSpacingTheme>(
  (ref) => AppSpacingTheme.small(),
);

@freezed
class AppSpacingTheme with _$AppSpacingTheme {
  const factory AppSpacingTheme({
    required double xxs,
    required double xs,
    required double ms,
    required double small,
    required double sm,
    required double medium,
    required double large,
    required double xl,
    required double xxl,
  }) = _AppSpacingTheme;

  factory AppSpacingTheme.small() => const AppSpacingTheme(
        xxs: 4,
        xs: 8,
        ms: 16,
        small: 24,
        sm: 32,
        medium: 40,
        large: 48,
        xl: 56,
        xxl: 64,
      );
}
