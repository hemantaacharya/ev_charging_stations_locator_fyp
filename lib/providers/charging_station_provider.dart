import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:ev_charging_stations_locator_fyp/models/charging_station.dart';

class ChargingStationProvider with ChangeNotifier {
  late List<ChargingStation> _allStations;
  late List<ChargingStation> _filteredStations;
  String _searchText = "";
  String _selectedType = "all";

  ChargingStationProvider() {
    _allStations = [];
    _filteredStations = [];
  }

  Future<void> initializeStations() async {
    try {
      String jsonString = await rootBundle.loadString('assets/data.json');
      List<dynamic> jsonData = json.decode(jsonString);
      _allStations = jsonData.map((data) {
        // Handle potential parsing errors using tryParse
        final double? parsedLatitude = double.tryParse(data['latitude'] ?? '');
        final double? parsedLongitude =
            double.tryParse(data['longitude'] ?? '');

        // Set default values (e.g., 0.0) if parsing fails
        final double latitude = parsedLatitude ?? 0.0;
        final double longitude = parsedLongitude ?? 0.0;

        return ChargingStation(
          id: data['id']?.toString() ?? '',
          name: data['name']?.toString() ?? 'Unknown',
          city: data['city']?.toString() ?? '',
          province: data['province']?.toString() ?? '',
          address: data['address']?.toString() ?? '',
          telephone: data['telephone']?.toString() ?? '',
          type: List<String>.from(data['type'] ?? []),
          latitude: latitude,
          longitude: longitude,
          amenities: data['amenities'] != null
              ? List<String>.from(data['amenities'])
              : [],
          features: data['features'] != null
              ? List<String>.from(data['features'])
              : [],
        );
      }).toList();

      _filteredStations = List.from(_allStations);
      notifyListeners();
    } catch (error) {
      print('Error initializing charging stations: $error');
      // Consider logging the error or displaying a user-friendly message
    }
  }

  List<ChargingStation> get stations => _filteredStations;
  String get searchText => _searchText;

  void setSearchText(String text) {
    _searchText = text.toLowerCase();
    _filterStations();
    notifyListeners();
  }

  void filterStationsByType(String type) {
    _selectedType = type;
    _filterStations();
    notifyListeners();
  }

  void _filterStations() {
    _filteredStations = _allStations.where((station) {
      final bool typeMatch =
          _selectedType == "all" || station.type.contains(_selectedType);
      final bool nameMatch = station.name.toLowerCase().contains(_searchText);
      final bool addressMatch =
          station.address.toLowerCase().contains(_searchText);
      return typeMatch && (nameMatch || addressMatch);
    }).toList();
  }
}
