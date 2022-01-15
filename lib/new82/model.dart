// To parse this JSON data, do
//
//     final postcode = postcodeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Postcode> postcodeFromJson(String str) => List<Postcode>.from(json.decode(str).map((x) => Postcode.fromJson(x)));

String postcodeToJson(List<Postcode> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Postcode {
  Postcode({
    required this.divisionId,
    required this.districtId,
    required this.upazila,
    required this.postOffice,
    required this.postCode,
  });

  String divisionId;
  String districtId;
  String upazila;
  String postOffice;
  String postCode;

  factory Postcode.fromJson(Map<String, dynamic> json) => Postcode(
    divisionId: json["division_id"],
    districtId: json["district_id"],
    upazila: json["upazila"],
    postOffice: json["postOffice"],
    postCode: json["postCode"],
  );

  Map<String, dynamic> toJson() => {
    "division_id": divisionId,
    "district_id": districtId,
    "upazila":upazila,
    "postOffice": postOffice,
    "postCode": postCode,
  };
}




