import 'package:ev_charging_stations_locator_fyp/screens/charging_stations_list_screen.dart';
import 'package:ev_charging_stations_locator_fyp/screens/map_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const ChargingStationListScreen());
      case '/map':
        return MaterialPageRoute(builder: (_) => const MapScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
