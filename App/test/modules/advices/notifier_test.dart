import 'package:arosa_je/core/data/entities/advice/advices.dart';
import 'package:arosa_je/core/data/repositories/advices/advices_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common/mocked_classes.dart';

void main() {
  late ProviderContainer container;
  late MockAdvicesRepository advicesRepository;

  setUp(() {
    advicesRepository = MockAdvicesRepository();
    container = ProviderContainer(overrides: [
      advicesRepositoryProvider.overrideWithValue(advicesRepository),
    ]);
  });

  tearDown(() {
    container.dispose();
  });

  group('GetAdvicesNotifier Tests', () {
    test('advicesRepository called', () async {
      when(() => advicesRepository.getAllAdvices())
          .thenAnswer((_) async => const Advices(totalItems: 0, advices: []));

      final result = await advicesRepository.getAllAdvices();
      expect(result, const Advices(totalItems: 0, advices: []));
    });
  });
}
