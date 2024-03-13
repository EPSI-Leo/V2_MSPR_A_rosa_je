import 'package:arosa_je/core/data/entities/plant/plants.dart';
import 'package:arosa_je/core/data/repositories/plants/add_plants/add_plants_repository.dart';
import 'package:arosa_je/core/data/repositories/plants/all_plants/all_plants_repository.dart';
import 'package:arosa_je/core/data/repositories/plants/my_plants/my_plants_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common/mocked_classes.dart';

void main() {
  late AddPlantsRepository addPlants;
  late AllPlantsRepository allPlants;
  late MyPlantsRepository myPlants;

  late MockApiMyPlants apiMyPlants;
  late MockApiAddPlants apiAddPlants;
  late MockApiAllPlants apiAllPlants;

  setUpAll(() {});

  setUp(() {
    apiMyPlants = MockApiMyPlants();
    apiAddPlants = MockApiAddPlants();
    apiAllPlants = MockApiAllPlants();

    addPlants = AddPlantsRepository(api: apiAddPlants);
    allPlants = AllPlantsRepository(api: apiAllPlants);
    myPlants = MyPlantsRepository(api: apiMyPlants);
  });

  tearDown(() {});

  /* group('addPlants', () {
    test('addPlants should return true after successful post', () async {
      when(() => apiAddPlants.postNewPlant(
            'Plant Name',
            '01/01/2024',
            '01/02/2024',
            'Plant Description',
            XFile('plant_image.jpg'),
          )).thenAnswer((_) async => true);

      final result = await addPlants.addPlants(
        'Plant Name',
        '01/01/2024',
        '01/02/2024',
        'Plant Description',
        XFile('plant_image.jpg'),
      );

      expect(result, true);
    });
  }); */

  group('allPlants', () {
    test('allPlants should return a list of plants', () async {
      when(() => apiAllPlants.allPlants())
          .thenAnswer((_) async => const Plants(totalItems: 0, plants: []));

      final result = await allPlants.allPlants();

      expect(result, isA<Plants>());
    });
  });

  group('myPlants', () {
    test('myPlants should return a list of plants', () async {
      when(() => apiMyPlants.myplants())
          .thenAnswer((_) async => const Plants(totalItems: 0, plants: []));

      final result = await myPlants.myPlants();

      expect(result, isA<Plants>());
    });
  });
}
