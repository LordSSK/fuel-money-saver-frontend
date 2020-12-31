import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:honda_smart_fuel/Provider/routeProvider.dart';
import 'package:honda_smart_fuel/Screens/map_selection_screen.dart';
import 'package:provider/provider.dart';

import 'routes.dart';

void main() {
  SdkContext.init(IsolateOrigin.main);
  // Making sure that BuildContext has MaterialLocalizations widget in the widget tree,
  // which is part of MaterialApp.
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  // Use _context only within the scope of this widget.
  BuildContext _context;
  RoutingExample _routingExample;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RouteProvider(),
        )
      ],
      child: MaterialApp(home: MapSelectionScreen(),theme: ThemeData(accentColor: Colors.amber),),
    );
  }
}
