import 'package:arosa_je/core/data/repositories/plants/plants/plants_repository.dart';
import 'package:arosa_je/modules/plants/add_plants/notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common/mocked_classes.dart';

void main() {
  late ProviderContainer container;
  late MockPlantsRepository plantsRepository;

  late String name;
  late String beginAt;
  late String endAt;
  late String description;
  late String picture;

  setUp(() {
    plantsRepository = MockPlantsRepository();
    container = ProviderContainer(overrides: [
      plantsRepositoryProvider.overrideWithValue(plantsRepository),
    ]);
  });

  tearDown(() {
    container.dispose();
  });

  group('AddPlantsNotifier Tests', () {
    test('addPlants repository called', () async {
      name = 'name';
      beginAt = 'beginAt';
      endAt = 'endAt';
      description = 'description';
      picture = 'picture';

      when(() => plantsRepository.addPlants(
              name, beginAt, endAt, description, picture))
          .thenAnswer((_) async => true);

      final result = await container
          .read(addPlantsProvider.notifier)
          .addPlants(name, beginAt, endAt, description, picture);

      verify(() => plantsRepository.addPlants(
          name, beginAt, endAt, description, picture)).called(1);
      expect(result, true);
    });

    test('addPlants repository error', () async {
      name = 'name';
      beginAt = 'beginAt';
      endAt = 'endAt';
      description = 'description';
      picture = 'picture';

      when(() => plantsRepository.addPlants(
              name, beginAt, endAt, description, picture))
          .thenThrow(Exception('Failed to add plant'));

      final result = container.read(addPlantsProvider.notifier).addPlants(
            name,
            beginAt,
            endAt,
            description,
            picture,
          );

      expect(() => result, throwsA(isA<Exception>()));
    });

    test('setName not empty', () {
      container.read(addPlantsFormProvider.notifier).setName('name');
      expect(container.read(addPlantsFormProvider).name, 'name');
    });

    test('setName empty', () {
      container.read(addPlantsFormProvider.notifier).setName('');
      expect(container.read(addPlantsFormProvider).name, '');
    });

    test('setBeginAt not empty', () {
      container.read(addPlantsFormProvider.notifier).setBeginAt('beginAt');
      expect(container.read(addPlantsFormProvider).beginAt, 'beginAt');
    });

    test('setBeginAt empty', () {
      container.read(addPlantsFormProvider.notifier).setBeginAt('');
      expect(container.read(addPlantsFormProvider).beginAt, '');
    });

    test('setEndAt not empty', () {
      container.read(addPlantsFormProvider.notifier).setEndAt('endAt');
      expect(container.read(addPlantsFormProvider).endAt, 'endAt');
    });

    test('setEndAt empty', () {
      container.read(addPlantsFormProvider.notifier).setEndAt('');
      expect(container.read(addPlantsFormProvider).endAt, '');
    });

    test('setDescription not empty', () {
      container
          .read(addPlantsFormProvider.notifier)
          .setDescription('description');
      expect(container.read(addPlantsFormProvider).description, 'description');
    });

    test('setDescription empty', () {
      container.read(addPlantsFormProvider.notifier).setDescription('');
      expect(container.read(addPlantsFormProvider).description, '');
    });

    test('setIsButtonActive true', () {
      container.read(addPlantsFormProvider.notifier).setIsButtonActive(true);
      expect(container.read(addPlantsFormProvider).isButtonActive, true);
    });

    test('setIsButtonActive false', () {
      container.read(addPlantsFormProvider.notifier).setIsButtonActive(false);
      expect(container.read(addPlantsFormProvider).isButtonActive, false);
    });

    test('isFieldsEmpty when all fields are filled', () {
      container.read(addPlantsFormProvider.notifier).setName('name');
      container.read(addPlantsFormProvider.notifier).setBeginAt('beginAt');
      container.read(addPlantsFormProvider.notifier).setEndAt('endAt');
      container
          .read(addPlantsFormProvider.notifier)
          .setDescription('description');

      expect(container.read(addPlantsFormProvider).isButtonActive, true);
    });

    test('isFieldsEmpty when some fields are empty', () {
      container.read(addPlantsFormProvider.notifier).setName('');
      container.read(addPlantsFormProvider.notifier).setBeginAt('beginAt');
      container.read(addPlantsFormProvider.notifier).setEndAt('endAt');
      container
          .read(addPlantsFormProvider.notifier)
          .setDescription('description');

      expect(container.read(addPlantsFormProvider).isButtonActive, false);
    });

    test('setLoading true', () {
      container.read(addPlantsFormProvider.notifier).setLoading(true);
      expect(container.read(addPlantsFormProvider).isLoading, true);
    });

    test('setLoading false', () {
      container.read(addPlantsFormProvider.notifier).setLoading(false);
      expect(container.read(addPlantsFormProvider).isLoading, false);
    });
  });
}
