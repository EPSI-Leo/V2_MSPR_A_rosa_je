import 'package:arosa_je/core/data/sources/remote/auth/login/api_login.dart';
import 'package:arosa_je/core/data/sources/remote/user/api_user.dart';
import 'package:arosa_je/core/local/session_manager/secure_storage_keys.dart';
import 'package:arosa_je/core/local/session_manager/session_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_repository.g.dart';

@riverpod
LoginRepository loginRepository(LoginRepositoryRef ref) {
  final api = ref.watch(apiLoginProvider);
  final apiUser = ref.watch(apiUserProvider);
  final sessionManager = ref.read(sessionManagerProvider);

  return LoginRepository(
    api: api,
    apiUser: apiUser,
    sessionManager: sessionManager,
  );
}

class LoginRepository {
  LoginRepository({
    required this.api,
    required this.apiUser,
    required this.sessionManager,
  });

  final ApiLogin api;
  final ApiUser apiUser;
  final SessionManager sessionManager;

  Future<bool> login(
    String username,
    String password,
  ) async {
    try {
      final response = await api.login(username, password);
      if (response != null) {
        final userInfos = await apiUser.getUserInfos(response.token.toString());
        sessionManager.writeSecureStorage(
          SecureStorageKeys.userInfos,
          userInfos.toString(),
        );
        sessionManager.writeSecureStorage(
          SecureStorageKeys.token,
          response.token.toString(),
        );
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Erreur lors de la connexion : $e');
      return false;
    }
  }
}
