import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/core/local/session_manager/secure_storage_keys.dart';
import 'package:arosa_je/core/local/session_manager/session_manager.dart';
import 'package:arosa_je/modules/chat/chat_list.dart';
import 'package:arosa_je/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionManager = ref.read(sessionManagerProvider);
    final coreL10n = context.coreL10n;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              "A'Rosa-je",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.edit_square),
            title: Text(coreL10n.advices),
            onTap: () async {
              context.goNamed(AppRoute.advice.name);
            },
          ),
          ListTile(
            leading: const Icon(Icons.compost),
            title: Text(coreL10n.myPlants),
            onTap: () {
              context.goNamed(AppRoute.userPlantList.name);
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: Text("Chat"), //TODO corel10n
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PeoplePage();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: Text(coreL10n.disconnect,
                style: const TextStyle(color: Colors.red)),
            onTap: () async {
              await sessionManager.deleteMultipleSecureStorage([
                SecureStorageKeys.userInfos,
                SecureStorageKeys.token,
              ]);

              context.goNamed(AppRoute.login.name);
            },
          ),
        ],
      ),
    );
  }
}
