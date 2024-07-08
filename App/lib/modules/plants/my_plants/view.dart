import 'dart:convert';
import 'dart:typed_data';

import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/core/data/entities/plant/plant_with_advices.dart';
import 'package:arosa_je/modules/plants/my_plants/notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPlants extends ConsumerStatefulWidget {
  const MyPlants({super.key});

  @override
  ConsumerState<MyPlants> createState() => _MyPlantsState();
}

class _MyPlantsState extends ConsumerState<MyPlants> {
  final Map<int, bool> _expandedState = {};

  Image decodeBase64Image(String base64ImageData) {
    List<int> imageBytes = base64.decode(base64ImageData);

    Uint8List uint8List = Uint8List.fromList(imageBytes);

    return Image.memory(
      uint8List,
      fit: BoxFit.cover,
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
                title: Text(coreL10n.myPlants),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      final plantId = data[index].plant.plant.id!;
                      setState(() {
                        _expandedState[plantId] = isExpanded;
                      });
                    },
                    children: data.map<ExpansionPanel>((Item item) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(item.plant.plant.name!),
                          );
                        },
                        body: ListTile(
                            title: Text(item.plant.plant.description!),
                            subtitle: Column(
                              children: [
                                decodeBase64Image(item.plant.plant.picture!),
                                _advicesList(item.plant.advices)
                              ],
                            )),
                        isExpanded:
                            _expandedState[item.plant.plant.id!] ?? false,
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }
          return Text(coreL10n.noResult);
        },
        loading: () => const Center(
              child: CircularProgressIndicator(color: Colors.black),
            ),
        error: (error, stackTrace) => Scaffold(
              appBar: AppBar(
                title: Text(coreL10n.myPlants),
              ),
              body: Center(child: Text(coreL10n.noResult)),
            ));
  }

  Widget _advicesList(List<AdviceWithName> advices) {
    return Column(
      children: advices
          .map((advice) => ListTile(
                title: Text('${advice.userFirstName} ${advice.userLastName}'),
                subtitle: Text(advice.advice1),
              ))
          .toList(),
    );
  }
}

class Item {
  Item({
    required this.plant,
    this.isExpanded = false,
  });

  MyPlantsWithAdvices plant;
  bool isExpanded;
}
