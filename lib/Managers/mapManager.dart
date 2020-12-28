import 'dart:typed_data';
import 'package:honda_smart_fuel/Model/petrolPumpModel.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/gestures.dart';
import 'package:here_sdk/routing.dart';

import 'package:here_sdk/mapview.dart';

class MapManager {
  MapManager._privateConstructor();

  List<PetrolPump> _petrolPumps = [];
  static final MapManager _instance = MapManager._privateConstructor();

  factory MapManager() {
    return _instance;
  }

  HereMapController _hereMapController;
  RoutingEngine _routingEngine;

  registerMapController(HereMapController hereMapController) {
    _hereMapController = hereMapController;
    _routingEngine = new RoutingEngine();
  }

  HereMapController get hereMapController {
    return _hereMapController;
  }

  RoutingEngine get routingEngine {
    return _routingEngine;
  }

  Future<void> getCitiesIntThePath(List<GeoCoordinates> vertices,Route route) async {
    _petrolPumps.clear();
    var ventLength = vertices.length;
    print("coordinate length" + ventLength.toString());
    int counter = 0;
    int previous = 0;
    int test = 0;
    await addCity(vertices[counter]);
    while (counter < ventLength) {
      if (vertices[counter].distanceTo(vertices[previous]) > 10000) {
         await addCity(vertices[counter]);
        previous = counter;
        test++;
      }
      counter++;
    }
    print("Counter is " + test.toString() + "Duration "+route.durationInSeconds.toString()+" Traffic "+route.trafficDelayInSeconds.toString());
  }

  Future<void> addCity(GeoCoordinates city) async {
    final coordinates = new Coordinates(city.latitude, city.longitude);
    var value = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = value.first;
    if (first.locality != null) {
      if (!_contains(first.locality)) {
        _petrolPumps
            .add(PetrolPump(city.latitude, city.longitude, first.locality));
        print("CITY " + first.locality);
      }
    }
  }

  bool _contains(String city) {
    _petrolPumps.forEach((element) {
      if (element.cityName == city) {
        return true;
      }
    });
    return false;
  }
}
