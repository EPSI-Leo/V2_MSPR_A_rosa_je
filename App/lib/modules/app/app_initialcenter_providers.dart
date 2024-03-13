// ignore: file_names
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:arosa_je/core/core.dart';

final initialCenterProvider = FutureProvider<LatLng?>((ref) async {
  try {
    final initialCenter = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    printDebug('Initial center : ${initialCenter.toString()}');
    return LatLng(initialCenter.latitude, initialCenter.longitude);
  } catch (e) {
    printDebug('Erreur lors de la récupération de la position : $e');
    return null;
  }
});
