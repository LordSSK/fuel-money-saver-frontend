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

  void getCitiesIntThePath(List<GeoCoordinates> vertices) {
    _petrolPumps.clear();
    var ventLength = vertices.length;
    print("coordinate length" + ventLength.toString());
    int intDiv = ventLength ~/ 125;
    print("div length" + intDiv.toString());

    for (int i = 0; i < vertices.length; i += intDiv) {
      final coordinates =
          new Coordinates(vertices[i].latitude, vertices[i].longitude);
      Geocoder.local.findAddressesFromCoordinates(coordinates).then((value) {
        var first = value.first;
        if (first.locality != null) {
          if (!_contains(first.locality)) {
            _petrolPumps.add(PetrolPump(
                vertices[i].latitude, vertices[i].longitude, first.locality));
          }
        }
      });
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
