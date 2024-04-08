import 'dart:async';

import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/core/local/session_manager/session_manager.dart';
import 'package:arosa_je/modules/app/app_initialcenter_providers.dart';
import 'package:arosa_je/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  bool _locationPermissionChecked = false;
  final Completer<void> _locationPermissionCompleter = Completer<void>();

  @override
  void initState() {
    super.initState();
    final sessionManager = ref.read(sessionManagerProvider);
    Future.delayed(Duration.zero, () async {
      final isLoggedIn = await sessionManager.isLoggedIn();
      _init(isLoggedIn);
    });
  }

  void _init(bool isLoggedIn) async {
    await _checkLocationPermission(
      isLoggedIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Affichez un indicateur de chargement ou autre chose ici si nécessaire

    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }

  Future<void> _checkLocationPermission(bool isLoggedIn) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // L'utilisateur a refusé l'autorisation, vous pouvez afficher un message ou quitter l'application.
        // Exemple: Navigator.pushReplacementNamed(context, '/page_sans_autorisation');
        // OU
        // exit(0); // Cela quittera l'application. Notez que l'utilisation d'exit(0) n'est généralement pas recommandée sur Flutter.
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // L'utilisateur a définitivement refusé l'autorisation.
      // Vous pouvez afficher un message ou quitter l'application.
      // Exemple: Navigator.pushReplacementNamed(context, '/page_sans_autorisation');
      // OU
      // exit(0);
      return;
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      // L'autorisation est accordée, vous pouvez naviguer vers la page HomePageView.
      printDebug('Autorisation accordée');
      _locationPermissionCompleter.complete();
      setState(() {
        _locationPermissionChecked = true;
      });

      // Effectuez la redirection après avoir vérifié la géolocalisation et la connexion
      // ignore: use_build_context_synchronously
      _navigateBasedOnPermissionAndLoginStatus(context, isLoggedIn);
    }
  }

  void _navigateBasedOnPermissionAndLoginStatus(
      BuildContext context, bool isLoggedIn) {
    ref.read(initialCenterProvider.future).then((LatLng? initialCenter) {
      if (_locationPermissionChecked) {
        if (initialCenter != null) {
          if (isLoggedIn) {
            context.goNamed(AppRoute.login.name); //TODO home
          } else {
            context.goNamed(AppRoute.login.name);
          }
        } else {
          Timer(const Duration(milliseconds: 1), () {
            context.goNamed(AppRoute.login.name);
          });
        }
      } else {
        // _checkLocationPermission n'est pas encore terminé, afficher un indicateur de chargement ou autre chose
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
