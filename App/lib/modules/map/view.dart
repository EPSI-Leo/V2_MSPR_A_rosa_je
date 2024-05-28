import 'dart:convert';
import 'dart:typed_data';

import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/core/data/entities/plant/plant.dart';
import 'package:arosa_je/modules/app/app_initialcenter_providers.dart';
import 'package:arosa_je/modules/chat/chat_view.dart';
import 'package:arosa_je/modules/map/notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapView extends ConsumerWidget {
  MapView({
    super.key,
  });

  final List<Marker> markers = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coreL10n = context.coreL10n;
    LatLng? initialCenter = ref.read(initialCenterProvider).value;
    final plantsList = ref.watch(allPlantsProvider);

    Image decodeBase64Image(String base64ImageData) {
      // Decode base64 image data
      List<int> imageBytes = base64.decode(base64ImageData);

      // Convert to Uint8List
      Uint8List uint8List = Uint8List.fromList(imageBytes);

      // Create an Image widget
      return Image.memory(
        uint8List,
        fit: BoxFit.cover,
      );
    }

    void showAlertDialog(BuildContext context, Plant plant) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(coreL10n.plantInfosSentence),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text('${coreL10n.plantName}: ${plant.name}'),
                    const Spacer(),
                    //TODO V3
                    /* IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                        receiveUserEmail: plant.userUsername,
                                        receiveUserID: plant.userFirebaseUid,
                                      )));
                        },
                        icon: const Icon(Icons.chat, color: Colors.black)), */
                  ],
                ),
                Text('${coreL10n.description}: ${plant.description}'),
                // Display each image in the list
                if (plant.picture is String)
                  decodeBase64Image(plant.picture as String),
                if (plant.picture is List<String>)
                  for (String base64ImageData in plant.picture as List<String>)
                    decodeBase64Image(base64ImageData),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(coreL10n.close),
              ),
            ],
          );
        },
      );
    }

    return plantsList.when(
      data: (plants) {
        if (plants != null) {
          for (final plant in plants) {
            markers.add(
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(plant.latitude!, plant.longitude!),
                child: IconButton(
                  onPressed: () {
                    showAlertDialog(context, plant);
                  },
                  icon: const Image(
                    image: AssetImage('assets/images/icon.png'),
                  ),
                ),
              ),
            );
          }
        }
        return map(initialCenter!,
            markers); //initialCenter!  const LatLng(45.54705, 5.97151),
      },
      loading: () => const Center(
        child: Center(
          child: CircularProgressIndicator(color: Colors.black),
        ),
      ),
      error: (error, stackTrace) {
        printDebug(error.toString());
        return map(initialCenter!, markers); // initialCenter!
      },
    );
  }

  Widget map(LatLng initialCenter, List<Marker> markers) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: initialCenter,
        initialZoom: 16.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () => launchUrl(
                Uri.parse('https://openstreetmap.org/copyright'),
              ),
            ),
          ],
        ),
        MarkerLayer(
          markers: [for (int i = 0; i < markers.length; i++) markers[i]],
        ),
      ],
    );
  }
}
