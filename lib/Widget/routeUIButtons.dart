import 'package:flutter/material.dart';
import 'package:honda_smart_fuel/Provider/routeProvider.dart';
import 'package:provider/provider.dart';

class RouteButtons extends StatefulWidget {
  @override
  _RouteButtonsState createState() => _RouteButtonsState();
}

class _RouteButtonsState extends State<RouteButtons> {
  RouteProvider routeProvider;
  bool isInit = false;

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
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              routeProvider.isCurrentRouteGenerated
                  ? FloatingActionButton(
                      onPressed: () {
                        routeProvider.getOptimalPath();
                      },
                      child: Icon(
                        Icons.map,
                        color: Colors.white,
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 15,
              ),
              routeProvider.markerCoordinates.length > 1
                  ? FloatingActionButton(
                      onPressed: () {
                        routeProvider.generateRoute();
                      },
                      child: Icon(
                        Icons.alt_route_rounded,
                        color: Colors.white,
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 15,
              ),
              FloatingActionButton(
                onPressed: () {
                  routeProvider.clearMap();
                },
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ],
      ),
    );
  }
}
