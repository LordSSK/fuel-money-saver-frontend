import 'dart:convert';

ResponseModel fromJsonResponse(String str) => ResponseModel.fromJson(json.decode(str));

class ResponseModel {
  ResponseModel({
    this.amtSaved,
    this.finalCost,
    this.originalCost,
    this.pumpIds,
  });

  double amtSaved;
  double finalCost;
  int originalCost;
  List<Pump> pumpIds;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        amtSaved: json["amtSaved"].toDouble(),
        finalCost: json["finalCost"].toDouble(),
        originalCost: json["originalCost"].toInt(),
        pumpIds: List<Pump>.from(json["pumpIds"].map((x) => Pump.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "amtSaved": amtSaved,
        "finalCost": finalCost,
        "originalCost": originalCost,
        "pumpIds": List<dynamic>.from(pumpIds.map((x) => x.toJson())),
      };
}

class Pump {
  Pump({this.id, this.spend, this.petrolRate});

  int id;
  double spend;
  double petrolRate;

  factory Pump.fromJson(Map<String, dynamic> json) =>
      Pump(id: json["id"], spend: json["spend"].toDouble(), petrolRate: json["petrolRate"].toDouble());

  Map<String, dynamic> toJson() => {"id": id, "spend": spend, "patrolRate": petrolRate};
}
