import 'package:flutter/material.dart';
import 'package:honda_smart_fuel/Managers/mapManager.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CarDetailsWidget extends StatefulWidget {
  @override
  _CarDetailsWidgetState createState() => _CarDetailsWidgetState();
}

class _CarDetailsWidgetState extends State<CarDetailsWidget> {
  TextEditingController _currentFuel, _fuelCapacity, _mileage;
  static const double maxCapacity=100;
  void onMileageChanged(String text) {
    if (text.isNotEmpty) {
      MapManager().mileage = double.parse(text);
    }
  }

  void onCapacityChanged(String text) {
    if (text.isNotEmpty) {
      MapManager().fuelCapacity = double.parse(text);
    }
  }

  void onCurrentFuelChanged(String text) {
    if (text.isNotEmpty) {
      MapManager().currentFuel = double.parse(text);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Current Fuel"),
        SfSlider(
          min: 0.0,
          max: maxCapacity,
          value: MapManager().currentFuel,
          interval: 20,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          minorTicksPerInterval: 1,
          onChanged: (dynamic value){
            setState(() {
              MapManager().currentFuel = value;
            });
          },
        ),
        SizedBox(height: 30,),
        Text("Fuel Capacity"),
        SfSlider(
          min: 0.0,
          max: maxCapacity,
          value: MapManager().fuelCapacity,
          interval: 20,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          minorTicksPerInterval: 1,
          onChanged: (dynamic value){
            setState(() {
              MapManager().fuelCapacity = value;
            });
          },
        ),
        SizedBox(height: 30,),
        Text("Mileage"),
        SfSlider(
          min: 0.0,
          max: maxCapacity,
          value: MapManager().mileage,
          interval: 20,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          minorTicksPerInterval: 1,
          onChanged: (dynamic value){
            setState(() {
              MapManager().mileage = value;
            });
          },
        ),
        SizedBox(height: 30,),
       /* TextField(
          controller: _currentFuel,
          onChanged: onCurrentFuelChanged,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: "Current Fuel"),
        ),
        TextField(
          controller: _fuelCapacity,
          onChanged: onCapacityChanged,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: "Capacity"),
        ),
        TextField(
          controller: _mileage,
          onChanged: onMileageChanged,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: "Mileage"),
        )*/
      ],
    );
  }
}
