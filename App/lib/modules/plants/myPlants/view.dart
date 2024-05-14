import 'dart:convert';
import 'dart:typed_data';

import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/core/data/entities/plant/plant.dart';
import 'package:arosa_je/modules/plants/myPlants/notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPlants extends ConsumerStatefulWidget {
  const MyPlants({super.key});

  @override
  _MyPlantsState createState() => _MyPlantsState();
}

class _MyPlantsState extends ConsumerState<MyPlants> {
  final Map<int, bool> _expandedState = {};

  Image decodeBase64Image(String base64ImageData) {
    // Decode base64 image data
    List<int> imageBytes = base64.decode(base64ImageData);

    // Convert to Uint8List
    Uint8List uint8List = Uint8List.fromList(imageBytes);

    // Create an Image widget
    return Image.memory(
      uint8List,
      fit: BoxFit.cover, // Adjust the fit as needed
    );
  }

  @override
  Widget build(BuildContext context) {
    final plantsList = ref.watch(myPlantsProvider);
    final coreL10n = context.coreL10n;

    return plantsList.when(
        data: (plants) {
          if (plants != null) {
            final data = <Item>[];

            for (final plant in plants) {
              data.add(Item(plant: plant));
            }

            return Scaffold(
              backgroundColor: Colors.grey[200],
              appBar: AppBar(
                title: const Text('My Plants'), //TODO localizations
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      final plantId = data[index].plant.id!;
                      setState(() {
                        _expandedState[plantId] = isExpanded;
                      });
                    },
                    children: data.map<ExpansionPanel>((Item item) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(item.plant.name!),
                          );
                        },
                        body: ListTile(
                          title: Text(item.plant.description!),
                          subtitle: decodeBase64Image(item.plant.picture!),
                        ),
                        isExpanded: _expandedState[item.plant.id!] ?? false,
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }
          return const Text('No plants found');
        },
        loading: () => const Center(
              child: CircularProgressIndicator(color: Colors.black),
            ),
        error: (error, stackTrace) => Scaffold(
              appBar: AppBar(
                title: const Text('My Plants'),
              ),
              body: Center(child: Text("No results found : $error")),
            ));
  }
}

class Item {
  Item({
    required this.plant,
    this.isExpanded = false,
  });

  Plant plant;
  bool isExpanded;
}
