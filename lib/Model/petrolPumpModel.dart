import 'package:here_sdk/core.dart';
import 'package:meta/meta.dart';

class PetrolPump {
  final int id;
  final GeoCoordinates geocoordinates;
  final String cityName;
  final double distToNext;
  final int totalDuration;
  final int trafficDelay;
  final double rate;
  double spend;
  double petrolRate;
  PetrolPump(
      {@required this.id,
      @required this.geocoordinates,
      @required this.cityName,
      @required this.distToNext,
      @required this.totalDuration,
      @required this.trafficDelay,
      this.rate = 1,
      this.petrolRate = 85,
      this.spend});

  Map<String, dynamic> toJson() {
    return {"id": id, "distToNext": distToNext, "totalDuration": totalDuration, "trafficDelay": trafficDelay, "cityName": cityName, "rate": rate};
  }

  factory PetrolPump.fromJson(Map<String, dynamic> json) => PetrolPump(
        id: json["id"],
        cityName: json["cityName"],
        distToNext: json["distToNext"].toDouble(),
        totalDuration: json["totalDuration"],
        trafficDelay: json["trafficDelay"],
        rate: json["rate"].toDouble(),
      );
}
