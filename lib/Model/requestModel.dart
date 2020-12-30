import 'dart:convert';

import 'package:honda_smart_fuel/Model/petrolPumpModel.dart';

class RequestModel {
  RequestModel({
    this.pumps,
    this.avgFuelRate,
    this.currentFuel,
    this.fuelCapacity,
  });

  List<PetrolPump> pumps;
  int avgFuelRate;
  int currentFuel;
  int fuelCapacity;

  Map<String, dynamic> toJson() => {
        "pumps": List<dynamic>.from(pumps.map((x) => x.toJson())),
        "avgFuelRate": avgFuelRate,
        "currentFuel": currentFuel,
        "fuelCapacity": fuelCapacity,
      };

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        pumps: List<PetrolPump>.from(json["pumps"].map((x) => PetrolPump.fromJson(x))),
        avgFuelRate: json["avgFuelRate"],
        currentFuel: json["currentFuel"],
        fuelCapacity: json["fuelCapacity"],
      );
}
