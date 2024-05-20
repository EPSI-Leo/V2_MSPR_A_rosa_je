import 'package:arosa_je/core/data/repositories/plants/plants/plants_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common/mocked_classes.dart';

void main() {
  late ProviderContainer container;
  late MockPlantsRepository plantsRepository;

  setUp(() {
    plantsRepository = MockPlantsRepository();
    container = ProviderContainer(overrides: [
      plantsRepositoryProvider.overrideWithValue(plantsRepository),
    ]);
  });

  tearDown(() {
    container.dispose();
  });

  group('FetchAllPlantsNotifier Tests', () {
    test('Repository called', () async {
      when(() => plantsRepository.allPlants()).thenAnswer((_) async => []);

      final result = await plantsRepository.allPlants();
      expect(result, []);
    });
  });
}
