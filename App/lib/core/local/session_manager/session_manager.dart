import 'package:arosa_je/core/local/session_manager/secure_storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_manager.g.dart';

@Riverpod(keepAlive: true)
SessionManager sessionManager(SessionManagerRef ref) {
  const storage = FlutterSecureStorage();
  return SessionManager(storage: storage);
}

class SessionManager {
  SessionManager({required this.storage});

  final FlutterSecureStorage storage;

  //key

  Future<void> writeSecureStorage(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readSecureStorage(String key) async {
    return await storage.read(key: key);
  }

  Future<void> deleteSecureStorage(String key) async {
    await storage.delete(key: key);
  }

  Future<void> deleteMultipleSecureStorage(List<String> keys) async {
    for (String key in keys) {
      await storage.delete(key: key);
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await storage.read(key: SecureStorageKeys.userInfos);
    return token != null;
  }
}
