class ChargingStation {
  final String id;
  final String name;
  final String city;
  final String province;
  final String address;
  final String telephone;
  final List<String> type;
  final double latitude;
  final double longitude;
  final List<String>? amenities;
  final List<String>? features;

  ChargingStation({
    required this.id,
    required this.name,
    required this.city,
    required this.province,
    required this.address,
    required this.telephone,
    required this.type,
    required this.latitude,
    required this.longitude,
    this.amenities,
    this.features,
  });
}
