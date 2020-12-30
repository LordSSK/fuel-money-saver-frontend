import 'dart:convert';
import 'package:honda_smart_fuel/Model/requestModel.dart';
import 'package:honda_smart_fuel/Model/responseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:honda_smart_fuel/Model/petrolPumpModel.dart';
import 'package:http/http.dart' as http;
import 'package:honda_smart_fuel/Managers/mapManager.dart';
class HTTPProvider {
  HTTPProvider._privateConstructor();

  List<PetrolPump> _petrolPumps = [];
  static final HTTPProvider _instance = HTTPProvider._privateConstructor();

  factory HTTPProvider() {
    return _instance;
  }

  Future<List<PetrolPump>> getOptimalPetrolPumps(List<PetrolPump> petrolPumps) async {
    _petrolPumps = petrolPumps;
    var response = await http.post('https://honda-fuel-app.herokuapp.com/fuel',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convertToJSON(petrolPumps));
    // print("BODY " + response.body);
    var body = ResponseModel.fromJson(jsonDecode(response.body));
    List<PetrolPump> holder = [];
    body.pumpIds.forEach((element) {
      var _pump = _petrolPumps.firstWhere((pump) => pump.id == element.id);
      _pump.spend = element.spend;
      holder.add(_pump);
    });
    return holder;
  }

  String convertToJSON(List<PetrolPump> petrolPumps) {
    print("LLL " + petrolPumps.length.toString());
    var test = json.encode(RequestModel(avgFuelRate: MapManager().mileage.toInt(), currentFuel: MapManager().currentFuel.toInt(), fuelCapacity: MapManager().fuelCapacity.toInt(), pumps: petrolPumps).toJson());
    print("Encoded JSON " + test.toString());
    return test.toString();
  }
}
