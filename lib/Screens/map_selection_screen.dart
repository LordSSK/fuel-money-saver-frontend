import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/gestures.dart';
import 'package:here_sdk/mapview.dart';
import 'package:honda_smart_fuel/Managers/mapManager.dart';
import 'package:honda_smart_fuel/Provider/routeProvider.dart';
import 'package:provider/provider.dart';
import 'package:honda_smart_fuel/Widget/carDetailsInputWidget.dart';
class MapSelectionScreen extends StatefulWidget {
  @override
  _MapSelectionScreenState createState() => _MapSelectionScreenState();
}

class _MapSelectionScreenState extends State<MapSelectionScreen> {
  RouteProvider routeProvider;
  bool isInit = false;
  bool isListenerAdded = false;

  @override
  void didChangeDependencies() {
    if (!isInit) {
      routeProvider = Provider.of<RouteProvider>(context, listen: true);
      isInit = true;
    }
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    //print("Debug  "+routeProvider.isRouteLoading.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Honda Smart Fuel Manager'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Stack(children: [
        HereMap(onMapCreated: _onMapCreated),
        routeProvider.isRouteLoading ? Align(alignment: Alignment.center, child: CircularProgressIndicator()) : Container(),
        CarDetailsWidget()
      ]),
    );
  }

  void _onMapCreated(HereMapController hereMapController) {

    MapManager().registerMapController(hereMapController);
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay, (MapError error) {
      if (error == null) {
      } else {
        print("Map scene not loaded. MapError: " + error.toString());
      }
    });
    if (!isListenerAdded) {
      print("adding listener");
      hereMapController.gestures.doubleTapListener = DoubleTapListener.fromLambdas(lambda_onDoubleTap: (Point2D touchPoint) {
        if (isInit) {
          routeProvider.addMarker(MapManager().hereMapController.viewToGeoCoordinates(touchPoint), 1);
        }
      });
      isListenerAdded = true;
    }
  }
}
