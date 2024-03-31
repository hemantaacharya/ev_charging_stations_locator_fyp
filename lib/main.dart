import 'package:ev_charging_stations_locator_fyp/providers/charging_station_provider.dart';
import 'package:ev_charging_stations_locator_fyp/screens/charging_stations_list_screen.dart';
import 'package:ev_charging_stations_locator_fyp/screens/home_screen.dart';
import 'package:ev_charging_stations_locator_fyp/screens/login_screen.dart';
import 'package:ev_charging_stations_locator_fyp/screens/map_screen.dart';
import 'package:ev_charging_stations_locator_fyp/screens/signup_screen.dart';
import 'package:ev_charging_stations_locator_fyp/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
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
