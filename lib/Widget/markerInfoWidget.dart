import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:honda_smart_fuel/Managers/textToSpeechManager.dart';
import 'package:honda_smart_fuel/Model/petrolPumpModel.dart';

class MarkerInfo extends StatelessWidget {
  final PetrolPump petrolPump;

  // final ResponseModel responseModel;

  MarkerInfo({Key key, this.petrolPump}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TTSManager().speakText("Take the next turn and Please fill " +
            petrolPump.spend.toStringAsFixed(2) +
            "amount of Fuel. Current Fuel rate at this station is " +
            petrolPump.petrolRate.toStringAsFixed(2));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: Card(
          color: HexColor("#30475e"),
          child: Column(
            children: [
              Container(
                child: Text(
                  "City " + petrolPump.cityName,
                  style: GoogleFonts.poppins(color: HexColor("#dddddd"), fontSize: 15, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                color: HexColor("#f05454"),
                width: 140,
                height: 25,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Petrol Rate " + " ₹" + petrolPump.petrolRate.toString(),
                style: GoogleFonts.poppins(color: HexColor("#dddddd"), fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Spend " + " ₹" + petrolPump.spend.toStringAsFixed(2), style: GoogleFonts.poppins(color: HexColor("#dddddd"), fontSize: 15)),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
