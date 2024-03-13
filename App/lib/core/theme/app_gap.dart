import 'package:arosa_je/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

enum _Spacing { xxs, xs, ms, s, m, l, xl, xxl }

extension _SpacingExtension on _Spacing {
  double toDoubleValue(AppSpacingTheme theme) {
    return switch (this) {
      _Spacing.xxs => theme.xxs,
      _Spacing.xs => theme.xs,
      _Spacing.ms => theme.ms,
      _Spacing.s => theme.small,
      _Spacing.m => theme.medium,
      _Spacing.l => theme.large,
      _Spacing.xl => theme.xl,
      _Spacing.xxl => theme.xxl,
    };
  }
}

class AppGap extends ConsumerWidget {
  const AppGap.xxs({super.key}) : _spacing = _Spacing.xxs;

  const AppGap.xs({super.key}) : _spacing = _Spacing.xs;

  const AppGap.ms({super.key}) : _spacing = _Spacing.ms;

  const AppGap.small({super.key}) : _spacing = _Spacing.s;

  const AppGap.medium({super.key}) : _spacing = _Spacing.m;

  const AppGap.large({super.key}) : _spacing = _Spacing.l;

  const AppGap.xl({super.key}) : _spacing = _Spacing.xl;

  const AppGap.xxl({super.key}) : _spacing = _Spacing.xxl;

  final _Spacing _spacing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacing = ref.watch(
      spacingThemeProvider.select(
        (theme) => _spacing.toDoubleValue(theme),
      ),
    );

    return Gap(spacing);
  }
}

class SliverAppGap extends ConsumerWidget {
  const SliverAppGap.xxs({super.key}) : _spacing = _Spacing.xxs;

  const SliverAppGap.xs({super.key}) : _spacing = _Spacing.xs;

  const SliverAppGap.ms({super.key}) : _spacing = _Spacing.ms;

  const SliverAppGap.small({super.key}) : _spacing = _Spacing.s;

  const SliverAppGap.medium({super.key}) : _spacing = _Spacing.m;

  const SliverAppGap.large({super.key}) : _spacing = _Spacing.l;

  const SliverAppGap.xl({super.key}) : _spacing = _Spacing.xl;

  const SliverAppGap.xxl({super.key}) : _spacing = _Spacing.xxl;

  final _Spacing _spacing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacing = ref.watch(
      spacingThemeProvider.select(
        (theme) => _spacing.toDoubleValue(theme),
      ),
    );

    return SliverGap(spacing);
  }
}
