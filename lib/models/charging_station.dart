import 'package:flutter/material.dart';

class ChargingStation {
  final String name;
  final String city;
  final String province;
  final String address;
  final String telephone;
  final List<String> type;
  final double latitude;
  final double longitude;

  ChargingStation({
    required this.name,
    required this.city,
    required this.province,
    required this.address,
    required this.telephone,
    required this.type,
    required this.latitude,
    required this.longitude,
  });

  dynamic operator [](String key) {
    switch (key) {
      case 'name':
        return name;
      case 'city':
        return city;
      case 'province':
        return province;
      case 'address':
        return address;
      case 'telephone':
        return telephone;
      case 'type':
        return type;
      case 'latitude':
        return latitude;
      case 'longitude':
        return longitude;
      default:
        return null; // Handle unknown key or return a default value
    }
  }
}
