// import 'package:ev_charging_stations_locator_fyp/data/station_data.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:ev_charging_stations_locator_fyp/providers/charging_station_provider.dart';

// void main() {
//   group('ChargingStationProvider', () {
//     late ChargingStationProvider chargingStationProvider;

//     setUp(() {
//       chargingStationProvider = ChargingStationProvider();
//     });

//     test('Initial state should show all stations', () {
//       // Arrange

//       // Act
//       final stations = chargingStationProvider.stations;

//       // Assert
//       expect(stations, equals(StationData.chargingStations));
//     });

//     test('setSearchText should update searchText and filter stations', () {
//       // Arrange
//       const searchText = 'example';

//       // Act
//       chargingStationProvider.setSearchText(searchText);
//       final filteredStations = chargingStationProvider.stations;

//       // Assert
//       expect(
//           chargingStationProvider.searchText, equals(searchText.toLowerCase()));
//       expect(
//           filteredStations.every((station) =>
//               station.name.toLowerCase().contains(searchText.toLowerCase()) ||
//               station.address.toLowerCase().contains(searchText.toLowerCase())),
//           isTrue);
//     });

//     test('filterStationsByType should update selectedType and filter stations',
//         () {
//       // Arrange
//       const selectedType = 'fast';

//       // Act
//       chargingStationProvider.filterStationsByType(selectedType);
//       final filteredStations = chargingStationProvider.stations;

//       // Assert
//       expect(chargingStationProvider.selectedType, equals(selectedType));
//       expect(
//           filteredStations
//               .every((station) => station.type.contains(selectedType)),
//           isTrue);
//     });
//   });
// }
