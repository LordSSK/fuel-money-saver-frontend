import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';

class MarkerInfo extends StatelessWidget {
  final  GeoCoordinates geoCoordinates;
   MarkerInfo({Key key, this.geoCoordinates}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(child: Text("Lat "+geoCoordinates.latitude.toString()+" LONG"+geoCoordinates.longitude.toString()),);
  }
}
