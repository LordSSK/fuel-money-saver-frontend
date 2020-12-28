import 'dart:typed_data';
import 'package:honda_smart_fuel/Model/petrolPumpModel.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/gestures.dart';
import 'package:here_sdk/routing.dart';

import 'package:here_sdk/routing.dart' as here;

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
  List<MapMarker> _mapMarker = [];
  MapImage _circleMapImage;

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

  Future<void> getCitiesInThePath(List<GeoCoordinates> vertices, Route route) async {
    _mapMarker.clear();
    _petrolPumps.clear();
    var ventLength = vertices.length;
    print("coordinate length" + ventLength.toString());
    int counter = 0;
    int previous = 0;
    int test = 0;
    await addCity(vertices[counter]);
    while (counter < ventLength) {
      if (vertices[counter].distanceTo(vertices[previous]) > 10000) {
        bool isCityAdded = await addCity(vertices[counter]);
        if (isCityAdded) {
          await getPathBetweenTwoPoint(vertices[previous], vertices[counter]);
        }
        previous = counter;
        test++;
      }
      counter++;
    }
    print("Counter is " + test.toString() + "Duration " + route.durationInSeconds.toString() + " Traffic " + route.trafficDelayInSeconds.toString());
  }

  Future<void> getPathBetweenTwoPoint(GeoCoordinates source, GeoCoordinates dest) async {
    List<Waypoint> points = [];
    points.add(Waypoint.withDefaults(source));
    points.add(Waypoint.withDefaults(dest));
    await routingEngine.calculateCarRoute(points, CarOptions.withDefaults(), (RoutingError routingError, List<here.Route> routeList) async {
      if (routingError == null) {
        here.Route route = routeList.first;
        print("Traffic Delay " +
            route.trafficDelayInSeconds.toString() +
            "s Total Duration " +
            route.durationInSeconds.toString() +
            "s TotalLength" +
            route.lengthInMeters.toString());
      } else {
        var error = routingError.toString();
        print("Error");
      }
    });
  }

  Future<void> addMarker(GeoCoordinates geoCoordinates, int drawOrder) async {
    Uint8List imagePixelData = await _loadFileAsUint8List('poi.png');
    _circleMapImage = MapImage.withPixelDataAndImageFormat(imagePixelData, ImageFormat.png);
    MapMarker mapMarker = MapMarker(geoCoordinates, _circleMapImage);
    mapMarker.drawOrder = drawOrder;
    _mapMarker.add(mapMarker);
    MapManager().hereMapController.mapScene.addMapMarker(mapMarker);
  }

  Future<bool> addCity(GeoCoordinates city) async {
    final coordinates = new Coordinates(city.latitude, city.longitude);
    var value = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = value.first;
    if (first.locality != null) {
      if (!_contains(first.locality)) {
        _petrolPumps.add(PetrolPump(city.latitude, city.longitude, first.locality));
        print("CITY " + first.locality);
        return true;
      }
    }
    return false;
  }

  bool _contains(String city) {
    _petrolPumps.forEach((element) {
      if (element.cityName == city) {
        return true;
      }
    });
    return false;
  }

  Future<Uint8List> _loadFileAsUint8List(String fileName) async {
    ByteData fileData = await rootBundle.load('assets/images/' + fileName);
    return Uint8List.view(fileData.buffer);
  }
}
