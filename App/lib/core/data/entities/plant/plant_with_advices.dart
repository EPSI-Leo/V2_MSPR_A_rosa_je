import 'package:arosa_je/core/data/entities/plant/plant.dart';

class MyPlantsWithAdvices {
  Plant plant;
  List<AdviceWithName> advices;

  MyPlantsWithAdvices({
    required this.plant,
    required this.advices,
  });

  factory MyPlantsWithAdvices.fromJson(Map<String, dynamic> json) {
    return MyPlantsWithAdvices(
      plant: Plant.fromJson(json['plant']),
      advices: List<AdviceWithName>.from(
          json['advices'].map((x) => AdviceWithName.fromJson(x))),
    );
  }
}

class AdviceWithName {
  int id;
  int idPlant;
  String userFirstName;
  String userLastName;
  String advice1;

  AdviceWithName({
    required this.id,
    required this.idPlant,
    required this.userFirstName,
    required this.userLastName,
    required this.advice1,
  });

  factory AdviceWithName.fromJson(Map<String, dynamic> json) {
    return AdviceWithName(
      id: json['id'],
      idPlant: json['idPlant'],
      userFirstName: json['userFirstName'],
      userLastName: json['userLastName'],
      advice1: json['advice1'],
    );
  }
}
