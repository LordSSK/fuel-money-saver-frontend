import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:honda_smart_fuel/Provider/routeProvider.dart';
import 'package:honda_smart_fuel/Screens/map_selection_screen.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RouteButtons extends StatefulWidget {
  final PanelController panelController;
  RouteButtons(this.panelController);

  @override
  _RouteButtonsState createState() => _RouteButtonsState();
}

class _RouteButtonsState extends State<RouteButtons> {
  RouteProvider routeProvider;
  bool isInit = false;

  void scrollUP() {
    if(widget.panelController.isPanelClosed){
      widget.panelController.open();
    }
    else{
      widget.panelController.close();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInit) {
      routeProvider = Provider.of<RouteProvider>(context);
      isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: scrollUP,
                color: Theme.of(context).accentColor,
                shape: CircleBorder(),
                height: 55,
                child: Icon(
                  Icons.car_repair,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  routeProvider.clearMap();
                },
                color: Theme.of(context).accentColor,
                shape: CircleBorder(),
                height: 55,
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              routeProvider.isCurrentRouteGenerated
                  ? MaterialButton(
                      onPressed: () {
                        routeProvider.getOptimalPath();
                      },
                      color: Theme.of(context).accentColor,
                      shape: CircleBorder(),
                      height: 55,
                      child: Icon(
                        Icons.map,
                        color: Colors.white,
                      ),
                    )
                  : Container(),
              routeProvider.markerCoordinates.length > 1
                  ? MaterialButton(
                      onPressed: () {
                        routeProvider.generateRoute();
                      },
                      color: Theme.of(context).accentColor,
                      shape: CircleBorder(),
                      height: 55,
                      child: Icon(
                        Icons.alt_route_rounded,
                        color: Colors.white,
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 15,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ],
      ),
    );
  }
}
