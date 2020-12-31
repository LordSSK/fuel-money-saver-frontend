import 'dart:convert';
import 'package:honda_smart_fuel/Model/requestModel.dart';
import 'package:honda_smart_fuel/Model/responseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:honda_smart_fuel/Model/petrolPumpModel.dart';
import 'package:http/http.dart' as http;
import 'package:honda_smart_fuel/Managers/mapManager.dart';
import 'dart:developer';
class HTTPProvider {
  HTTPProvider._privateConstructor();

  List<PetrolPump> _petrolPumps = [];
  static final HTTPProvider _instance = HTTPProvider._privateConstructor();

  factory HTTPProvider() {
    return _instance;
  }

  Future<List<PetrolPump>> getOptimalPetrolPumps(List<PetrolPump> petrolPumps) async {
    _petrolPumps = petrolPumps;
    var headers = {
      'Content-Type': 'application/json'
    };
    var response =await http.post("https://honda-fuel-app.herokuapp.com/fuel",body: convertToJSON(petrolPumps),headers: headers);
     print("BODY " + response.body);
    var body = ResponseModel.fromJson(jsonDecode(response.body));
    List<PetrolPump> holder = [];
    body.pumpIds.forEach((element) {
      var _pump = _petrolPumps.firstWhere((pump) => pump.id == element.id);
      _pump.spend = element.spend;
      _pump.petrolRate=element.petrolRate;
      holder.add(_pump);
    });
    return holder;
  }

  String convertToJSON(List<PetrolPump> petrolPumps) {
    print("LLL " + petrolPumps.length.toString());
    var test = json.encode(RequestModel(avgFuelRate: MapManager().mileage.toInt(), currentFuel: MapManager().currentFuel.toInt(), fuelCapacity: MapManager().fuelCapacity.toInt(), pumps: petrolPumps).toJson());
    log("Encoded JSON " + test.toString());
    return test.toString();
  }
}
