import 'package:arosa_je/core/data/repositories/advices/advices_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

@Riverpod(keepAlive: false)
class AddAvice extends _$AddAvice {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> addAvice(
    String name,
    String advice1,
  ) async {
    state = const AsyncLoading();
    /* ref.read(addAviceFormProvider.notifier).setConnectionMessageError(
          AuthAlertMessage.none,
        );*/
    final addAviceRepository = ref.read(advicesRepositoryProvider);
    state = await AsyncValue.guard(() => addAviceRepository.postAdvice(
          name,
          advice1,
        ));
  }
}
