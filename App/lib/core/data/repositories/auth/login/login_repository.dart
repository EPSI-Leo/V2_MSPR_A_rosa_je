import 'package:arosa_je/core/data/sources/remote/auth/login/api_login.dart';
import 'package:arosa_je/core/local/session_manager/secure_storage_keys.dart';
import 'package:arosa_je/core/local/session_manager/session_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_repository.g.dart';

@riverpod
LoginRepository loginRepository(LoginRepositoryRef ref) {
  final api = ref.watch(apiLoginProvider);
  final sessionManager = ref.read(sessionManagerProvider);

  return LoginRepository(
    api: api,
    sessionManager: sessionManager,
  );
}

class LoginRepository {
  const LoginRepository({
    required this.api,
    required this.sessionManager,
  });
  final ApiLogin api;
  final SessionManager sessionManager;

  Future<bool> login(
    String username,
    String password,
  ) async {
    final response = await api.login(
      username,
      password,
    );

    if (response != null) {
      await sessionManager.writeSecureStorage(
        SecureStorageKeys.userInfos,
        response.id.toString(),
      );
      await sessionManager.writeSecureStorage(
        SecureStorageKeys.userInfos,
        response.token.toString(),
      );
    }
    return true;
  }
}
