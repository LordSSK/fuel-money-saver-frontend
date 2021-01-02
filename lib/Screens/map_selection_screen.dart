import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/gestures.dart';
import 'package:here_sdk/mapview.dart';
import 'package:honda_smart_fuel/Managers/mapManager.dart';
import 'package:honda_smart_fuel/Provider/routeProvider.dart';
import 'package:honda_smart_fuel/Widget/routeUIButtons.dart';
import 'package:provider/provider.dart';
import 'package:honda_smart_fuel/Widget/carDetailsInputWidget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';





class MapSelectionScreen extends StatefulWidget {
  @override
  _MapSelectionScreenState createState() => _MapSelectionScreenState();
}

class _MapSelectionScreenState extends State<MapSelectionScreen> {
  RouteProvider routeProvider;
  bool isInit = false;
  bool isListenerAdded = false;
  final _panelController = PanelController();

  @override
  void didChangeDependencies() {
    if (!isInit) {
      routeProvider = Provider.of<RouteProvider>(context, listen: true);
      isInit = true;
    }
    super.didChangeDependencies();
  }

  void scrollUpPanel() {
    if (_panelController.isPanelClosed) {
      _panelController.open();
    } else {
      _panelController.close();
    }
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
        routeProvider.isCalculatingOptimalRoute
            ? Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Generating optimal Path...",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SpinKitPouringHourglass(
                          color: Colors.grey,
                          size: 50.0,
                        ),
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  width: 200,
                  height: 100,
                ))
            : Container(),
        //CarDetailsWidget(),
        RouteButtons(_panelController),
        SlidingUpPanel(
          controller: _panelController,
          color: Colors.white,
          minHeight: 50,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
          panel: Container(
            child: Column(
              children: [
                MaterialButton(
                  onPressed: (){},
                  shape: CircleBorder(),
                  color:  Theme.of(context).accentColor,
                  height: 75,
                  child: Icon(Icons.car_repair,color: Theme.of(context).canvasColor,size: 30,),
                ),
                SizedBox(
                  height: 20,
                ),
                CarDetailsWidget(),
              ],
            ),
          ),
        ),
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
