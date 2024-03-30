// import 'package:ev_charging_stations_locator_fyp/screens/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:ev_charging_stations_locator_fyp/screens/charging_stations_list_screen.dart';
// import 'package:ev_charging_stations_locator_fyp/screens/map_screen.dart';

// void main() {
//   group('HomeScreen', () {
//     testWidgets('Initial state should show ChargingStationsListScreen',
//         (WidgetTester tester) async {
//       // Arrange
//       await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

//       // Act
//       final chargingStationsListScreenFinder =
//           find.byType(ChargingStationsListScreen);

//       // Assert
//       expect(chargingStationsListScreenFinder, findsOneWidget);
//     });

//     testWidgets('Tapping on Map tab should show MapScreen',
//         (WidgetTester tester) async {
//       // Arrange
//       await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

//       // Act
//       await tester.tap(find.text('Map'));
//       await tester.pumpAndSettle();
//       final mapScreenFinder = find.byType(MapScreen);

//       // Assert
//       expect(mapScreenFinder, findsOneWidget);
//     });
//   });
// }
