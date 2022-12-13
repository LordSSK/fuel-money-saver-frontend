import 'package:flutter/material.dart';
import 'package:honda_smart_fuel/Provider/httpProvider.dart';

class RouteOutput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: HTTPProvider().isResponseLoaded ? 75 : 0,
      child: SingleChildScrollView(
        child: HTTPProvider().isResponseLoaded
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text("Original Cost"),
                      SizedBox(
                        height: 20,
                      ),
                      Text("₹ " + HTTPProvider().responseModel.originalCost.toStringAsFixed(2))
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text("Final Amount"),
                      SizedBox(
                        height: 20,
                      ),
                      Text("₹ " + HTTPProvider().responseModel.finalCost.toStringAsFixed(2))
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text("Amount Saved"),
                      SizedBox(
                        height: 20,
                      ),
                      Text("₹ " + HTTPProvider().responseModel.amtSaved.toStringAsFixed(2))
                    ],
                  ),
                ],
              )
            : Container(),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
    );
  }
}
