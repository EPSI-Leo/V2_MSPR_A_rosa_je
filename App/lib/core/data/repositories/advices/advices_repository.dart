import 'package:arosa_je/core/data/entities/advice/advices.dart';
import 'package:arosa_je/core/data/sources/remote/advices/api_advices.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'advices_repository.g.dart';

@riverpod
AdvicesRepository advicesRepository(AdvicesRepositoryRef ref) {
  final api = ref.watch(apiAdvicesProvider);

  return AdvicesRepository(
    api: api,
  );
}

class AdvicesRepository {
  const AdvicesRepository({
    required this.api,
  });
  final ApiAdvices api;

  Future<Advices?> getAllAdvices() async {
    return await api.getAllAdvices();
  }

  Future<bool> postAdvice(
    String name,
    String advice1,
  ) async {
    await api.postAdvice(name, advice1);
    return true;
  }
}
