import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:honda_smart_fuel/Managers/textToSpeechManager.dart';
import 'package:honda_smart_fuel/Model/petrolPumpModel.dart';

class MarkerInfo extends StatelessWidget {
  final PetrolPump petrolPump;

  MarkerInfo({Key key, this.petrolPump}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TTSManager().speakText("Hello, Please fill " +
            petrolPump.spend.toStringAsFixed(2) +
            "amount of Fuel. Current Fuel rate at this station is " +
            petrolPump.petrolRate.toStringAsFixed(2));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Card(
          child: Column(
            children: [
              Container(child: Text("City " + petrolPump.cityName), color: Colors.amber),
              SizedBox(
                height: 10,
              ),
              Text("Petrol Rate " + petrolPump.petrolRate.toString()),
              SizedBox(
                height: 5,
              ),
              Text("Spend " + petrolPump.spend.toStringAsFixed(2)),
            ],
          ),
        ),
      ),
    );
  }
}
