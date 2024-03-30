// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:ev_charging_stations_locator_fyp/models/charging_station.dart';
// import 'package:ev_charging_stations_locator_fyp/providers/charging_station_provider.dart';
// import 'package:ev_charging_stations_locator_fyp/screens/map_screen.dart';

// void main() {
//   group('MapScreen', () {
//     testWidgets('Initial state should show GoogleMap',
//         (WidgetTester tester) async {
//       // Arrange
//       await tester.pumpWidget(
//         MaterialApp(
//           home: ChangeNotifierProvider(
//             create: (_) => ChargingStationProvider(),
//             child: MapScreen(),
//           ),
//         ),
//       );

//       // Act
//       final googleMapFinder = find.byType(GoogleMap);

//       // Assert
//       expect(googleMapFinder, findsOneWidget);
//     });

//     testWidgets('Tapping on marker should call _onMarkerTap',
//         (WidgetTester tester) async {
//       // Arrange
//       final chargingStation = ChargingStation(
//         markerId: '1',
//         latitude: 37.7749,
//         longitude: -122.4194,
//         name: 'Test Station',
//         address: '123 Test St',
//       );
//       await tester.pumpWidget(
//         MaterialApp(
//           home: ChangeNotifierProvider(
//             create: (_) => ChargingStationProvider(),
//             child: MapScreen(),
//           ),
//         ),
//       );

//       // Act
//       final mapScreen = tester.widget<MapScreen>(find.byType(MapScreen));
//       mapScreen._onMarkerTap(chargingStation);

//       // Assert
//       expect(mapScreen._markers.length,
//           2); // Including the current location marker
//       expect(mapScreen._markers.any((marker) => marker.markerId.value == '1'),
//           isTrue);
//     });

//     // Add more test cases for different scenarios
//   });
// }

// class _onMarkerTap {}
