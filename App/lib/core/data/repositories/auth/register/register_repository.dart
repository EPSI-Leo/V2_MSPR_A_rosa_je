import 'package:arosa_je/core/data/sources/remote/auth/register/api_register.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_repository.g.dart';

@riverpod
RegisterRepository registerRepository(RegisterRepositoryRef ref) {
  final api = ref.watch(apiRegisterProvider);

  return RegisterRepository(
    api: api,
  );
}

class RegisterRepository {
  const RegisterRepository({
    required this.api,
  });
  final ApiRegister api;

  Future<bool> register(
    String username,
    String password,
  ) async {
    await api.register(
      username,
      password,
    );

    return true;
  }
}
