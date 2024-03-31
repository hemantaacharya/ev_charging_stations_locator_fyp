import 'package:flutter/material.dart';
import 'package:ev_charging_stations_locator_fyp/screens/charging_stations_list_screen.dart';
import 'package:ev_charging_stations_locator_fyp/screens/map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // To keep track of selected tab

  final List<Widget> _screens = [
    const ChargingStationsListScreen(),
    const MapScreen(),
  ];

  final List<String> _titles = [
    'Charging Stations',
    'Map',
  ]; // Titles for the tab bar

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screens.length,
      initialIndex: _selectedIndex,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green.shade200,
          title: const Text(
            'Home',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
          automaticallyImplyLeading: false, // Remove the back button
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _titles
                    .asMap()
                    .map((index, title) => MapEntry(
                          index,
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: _selectedIndex == index
                                    ? Colors.green.shade600
                                    : Colors.green.shade300,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: _selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ))
                    .values
                    .toList(),
              ),
            ),
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
      ),
    );
  }
}
