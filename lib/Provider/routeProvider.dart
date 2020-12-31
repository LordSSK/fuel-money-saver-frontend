import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:here_sdk/routing.dart';
import 'package:here_sdk/routing.dart' as here;
import 'package:honda_smart_fuel/Managers/mapManager.dart';

class RouteProvider with ChangeNotifier {
  MapImage _circleMapImage;
  List<GeoCoordinates> _coordinates = [];
  List<String> cities = [];
  List<MapPolyline> _mapPolylines = [];
  bool areCitiesLoaded = false;
  List<MapMarker> _mapMarker = [];
  bool isRouteLoading = false;

  Future<void> addMarker(GeoCoordinates geoCoordinates, int drawOrder) async {
    print("adding marker" + _coordinates.length.toString());
    if (_coordinates.length == 0) {
      cities.clear();
      _mapMarker.forEach((marker) {
        MapManager().hereMapController.mapScene.removeMapMarker(marker);
      });
      _mapMarker.clear();
      clearMap();
      notifyListeners();
    }
    _coordinates.add(geoCoordinates);
    if (_coordinates.length < 3) {
      if (_circleMapImage == null) {
        Uint8List imagePixelData = await _loadFileAsUint8List('poi.png');
        _circleMapImage = MapImage.withPixelDataAndImageFormat(imagePixelData, ImageFormat.png);
      }
      MapMarker mapMarker = MapMarker(geoCoordinates, _circleMapImage);
      mapMarker.drawOrder = drawOrder;
      _mapMarker.add(mapMarker);
      MapManager().hereMapController.mapScene.addMapMarker(mapMarker);
      //notifyListeners();
    }
    if (_coordinates.length == 2) {
      isRouteLoading = true;
      notifyListeners();
      generateRoute();
    }
  }

  Future<void> generateRoute() async {
    var startGeoCoordinates = _coordinates[0];
    var destinationGeoCoordinates = _coordinates[1];
    var startWaypoint = Waypoint.withDefaults(startGeoCoordinates);
    var destinationWaypoint = Waypoint.withDefaults(destinationGeoCoordinates);
    List<Waypoint> waypoints = [startWaypoint, destinationWaypoint];
    await MapManager().routingEngine.calculateCarRoute(waypoints, CarOptions.withDefaults(),
        (RoutingError routingError, List<here.Route> routeList) async {
      if (routingError == null) {
        here.Route route = routeList.first;
        _showRouteOnMap(route);
      } else {
        var error = routingError.toString();
        print("Error");
      }
    });
    _coordinates.clear();
  }

  Future<void> _showRouteOnMap(here.Route route) async {
    GeoPolyline routeGeoPolyline = GeoPolyline(route.polyline);
    double widthInPixels = 20;
    MapPolyline routeMapPolyline = MapPolyline(routeGeoPolyline, widthInPixels,Colors.blueAccent);
    MapManager().hereMapController.mapScene.addMapPolyline(routeMapPolyline);
    _mapPolylines.add(routeMapPolyline);
    await MapManager().getCitiesInThePath(routeGeoPolyline.vertices, route);
    isRouteLoading = false;
    notifyListeners();
  }

  Future<Uint8List> _loadFileAsUint8List(String fileName) async {
    ByteData fileData = await rootBundle.load('assets/images/' + fileName);
    return Uint8List.view(fileData.buffer);
  }

  void clearMap() {
    for (var mapPolyline in _mapPolylines) {
      MapManager().hereMapController.mapScene.removeMapPolyline(mapPolyline);
    }
    _mapPolylines.clear();
  }
}
