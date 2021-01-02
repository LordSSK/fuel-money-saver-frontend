import 'package:flutter/material.dart';
import 'package:honda_smart_fuel/Managers/mapManager.dart';

class CarDetailsWidget extends StatefulWidget {
  @override
  _CarDetailsWidgetState createState() => _CarDetailsWidgetState();
}

class _CarDetailsWidgetState extends State<CarDetailsWidget> {
  TextEditingController _currentFuel, _fuelCapacity, _mileage;

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
        TextField(
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
        )
      ],
    );
  }
}
