import 'package:ev_charging_stations_locator_fyp/providers/charging_station_provider.dart';
import 'package:ev_charging_stations_locator_fyp/screens/charging_stations_list_screen.dart';
import 'package:ev_charging_stations_locator_fyp/screens/home_screen.dart';
import 'package:ev_charging_stations_locator_fyp/screens/map_screen.dart';
import 'package:ev_charging_stations_locator_fyp/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChargingStationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hemanta's App",
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/': (context) => const HomeScreen(),
          '/list': (context) => const ChargingStationsListScreen(),
          '/map': (context) => const MapScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return MaterialPageRoute(builder: (context) => const HomeScreen());
          }
          return null;
        },
      ),
    );
  }
}
