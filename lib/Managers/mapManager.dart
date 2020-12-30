import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:here_sdk/routing.dart';
import 'package:here_sdk/routing.dart' as here;
import 'package:honda_smart_fuel/Model/petrolPumpModel.dart';
import 'package:honda_smart_fuel/Provider/httpProvider.dart';
import 'package:honda_smart_fuel/Widget/markerInfoWidget.dart';

class MapManager {
  MapManager._privateConstructor();

  List<PetrolPump> _petrolPumps = [];
  static final MapManager _instance = MapManager._privateConstructor();

  factory MapManager() {
    return _instance;
  }

  List<WidgetPin> _markers = [];
  HereMapController _hereMapController;
  RoutingEngine _routingEngine;
  List<MapMarker> _mapMarker = [];
  MapImage _circleMapImage;
  double mileage=16;
  double fuelCapacity=40;
  double currentFuel=0;



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

  void updateCarDetails(double mileage,double fuelCapacity,double currentFuel){
    print("Changing to "+mileage.toString());
    this.mileage=mileage;
    this.fuelCapacity=fuelCapacity;
    this.currentFuel=currentFuel;
  }


  Future<void> getCitiesInThePath(List<GeoCoordinates> vertices, here.Route route) async {
    _mapMarker.clear();
    _petrolPumps.clear();
    _markers.forEach((element) {
      element.unpin();
    });
    var ventLength = vertices.length;
    print("coordinate length" + ventLength.toString());
    int counter = 0;
    int previous = 0;
    int test = 0;
    for (int i = 0; i < ventLength; i++) {
      if (vertices[i].distanceTo(vertices[previous]) > 10000 || i == ventLength - 1) {
        await calculate(vertices[previous], vertices[i], i);
        previous = i;
        // print("Counter " + i.toString());
      }
    }
    // print("Counter is " + test.toString() + "Duration " + route.durationInSeconds.toString() + " Traffic " + route.trafficDelayInSeconds.toString());
    _petrolPumps.forEach((element) {
      print(element.cityName + "Dada");
    });
    Future.delayed(Duration(milliseconds: 1000), getOptimalPetrolPumps);
  }

  Future<void> calculate(GeoCoordinates start, GeoCoordinates end, int counter) async {
    var address = await getAddress(start);
    await getPathBetweenTwoPoint(start, end, counter.toDouble(), address);
  }

  Future<Address> getAddress(GeoCoordinates source) async {
    final coordinates = new Coordinates(source.latitude, source.longitude);
    var value = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return value.first;
  }

  Future<void> getOptimalPetrolPumps() async {
    HTTPProvider().getOptimalPetrolPumps(_petrolPumps);
  }

  Future<void> getPathBetweenTwoPoint(GeoCoordinates source, GeoCoordinates dest, double id, Address address) async {
    List<Waypoint> points = [];
    points.add(Waypoint.withDefaults(source));
    points.add(Waypoint.withDefaults(dest));
    await routingEngine.calculateCarRoute(points, CarOptions.withDefaults(), (RoutingError routingError, List<here.Route> routeList) {
      if (routingError == null) {
        here.Route route = routeList.first;
        print("Traffic Delay " +
            route.trafficDelayInSeconds.toString() +
            "s Total Duration " +
            route.durationInSeconds.toString() +
            "s TotalLength" +
            route.lengthInMeters.toString());
        if (address.locality != null) {
          if (!_contains(address.locality)) {
            print("IN IFFF" + _petrolPumps.length.toString());
            _petrolPumps.add(new PetrolPump(
                id: id.toInt(),
                cityName: address.locality,
                geocoordinates: source,
                distToNext: route.lengthInMeters / 1000,
                totalDuration: route.durationInSeconds,
                trafficDelay: route.trafficDelayInSeconds,
                rate: 1));
            print("CITY " + address.locality + _petrolPumps.length.toString());
          }
        }
      } else {
        var error = routingError.toString();
        print("Error");
      }
    });
  }

  void addMarker(PetrolPump petrolPump) {
    _markers.add(hereMapController.pinWidget(
        MarkerInfo(
          key: ValueKey(petrolPump),
          petrolPump: petrolPump,
        ),
        petrolPump.geocoordinates));
  }

  bool _contains(String city) {
    _petrolPumps.forEach((element) {
      if (element.cityName == city) {
        print("CONTAINS " + city);
        return true;
      }
    });
    print("CONTAINS no " + city);
    return false;
  }
}
