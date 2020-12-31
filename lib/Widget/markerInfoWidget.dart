import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:honda_smart_fuel/Model/petrolPumpModel.dart';

class MarkerInfo extends StatelessWidget {
  final PetrolPump petrolPump;

  MarkerInfo({Key key, this.petrolPump}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text("City "+petrolPump.cityName),
          Text("Petrol Rate "+petrolPump.petrolRate.toString()),
          Text("Spend "+petrolPump.spend.toStringAsFixed(2)),
        ],
      ),
    );
  }
}
