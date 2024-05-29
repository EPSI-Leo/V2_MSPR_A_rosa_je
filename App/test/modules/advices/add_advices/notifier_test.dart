import 'package:arosa_je/core/data/repositories/advices/advices_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common/mocked_classes.dart';

void main() {
  late ProviderContainer container;
  late MockAdvicesRepository advicesRepository;

  late String name;
  late String advice1;
  late int? idPlant;

  setUp(() {
    advicesRepository = MockAdvicesRepository();
    container = ProviderContainer(overrides: [
      advicesRepositoryProvider.overrideWithValue(advicesRepository),
    ]);
  });

  tearDown(() {
    container.dispose();
  });

  group('AddAdvicesNotifier Tests', () {
    test('advicesRepository called', () async {
      name = 'name';
      advice1 = 'advice1';
      idPlant = 1;

      when(() => advicesRepository.postAdvice(name, advice1, idPlant))
          .thenAnswer((_) async => true);

      final result = await advicesRepository.postAdvice(name, advice1, idPlant);
      expect(result, true);
    });
  });
}
