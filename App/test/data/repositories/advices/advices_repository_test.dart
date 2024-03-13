import 'package:arosa_je/core/data/entities/advice/advices.dart';
import 'package:arosa_je/core/data/repositories/advices/advices_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common/mocked_classes.dart';

void main() {
  late AdvicesRepository sut;

  late MockApiAdvices apiAdvices;

  setUpAll(() {});

  setUp(() {
    apiAdvices = MockApiAdvices();
    sut = AdvicesRepository(api: apiAdvices);
  });

  tearDown(() {});

  group('getAllAdvices', () {
    test('getAllAdvices is called', () async {
      when(() => apiAdvices.getAllAdvices()).thenAnswer((_) async => null);

      await sut.getAllAdvices();
      verify(() => apiAdvices.getAllAdvices()).called(1);
    });

    test('case success', () async {
      when(() => apiAdvices.getAllAdvices())
          .thenAnswer((_) async => const Advices(totalItems: 0, advices: []));

      final result = await sut.getAllAdvices();
      expect(result, const Advices(totalItems: 0, advices: []));
    });
  });

  group('postAdvice', () {
    test('postAdvice is called', () async {
      when(() => apiAdvices.postAdvice('name', 'advice1'))
          .thenAnswer((_) async => null);

      await sut.postAdvice('name', 'advice1');
      verify(() => apiAdvices.postAdvice('name', 'advice1')).called(1);
    });

    test('case success', () async {
      when(() => apiAdvices.postAdvice('name', 'advice1'))
          .thenAnswer((_) async => null);

      final result = await sut.postAdvice('name', 'advice1');
      expect(result, true);
    });
  });
}
