import 'package:arosa_je/core/data/entities/advice/advices.dart';
import 'package:arosa_je/core/data/repositories/advices/advices_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

@Riverpod(keepAlive: false)
class GetAdvices extends _$GetAdvices {
  @override
  FutureOr<Advices?> build() {
    return fetchAdvices();
  }

  Future<Advices?> fetchAdvices() async {
    final repository = ref.read(advicesRepositoryProvider);
    final advices = await repository.getAllAdvices();
    return advices;
  }

  Future<void> refresh() async {
    ref.refresh(advicesRepositoryProvider);
  }
}
