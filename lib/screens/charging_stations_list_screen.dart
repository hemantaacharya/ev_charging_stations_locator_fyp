// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ev_charging_stations_locator_fyp/providers/charging_station_provider.dart';
import 'package:ev_charging_stations_locator_fyp/widgets/charging_station_card.dart';
import 'package:ev_charging_stations_locator_fyp/widgets/custom_search_bar.dart';

class ChargingStationsListScreen extends StatefulWidget {
  const ChargingStationsListScreen({super.key});

  @override
  _ChargingStationsListScreenState createState() =>
      _ChargingStationsListScreenState();
}

class _ChargingStationsListScreenState
    extends State<ChargingStationsListScreen> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      await Provider.of<ChargingStationProvider>(context, listen: false)
          .initializeStations();
      setState(() {
        _isInitialized = true;
      });
    } catch (error) {
      print('Error initializing charging stations: $error');
      // Handle error (display error message, retry logic, etc.)
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChargingStationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          // Wrap CustomSearchBar with Expanded for flexible sizing
          Expanded(
            child: CustomSearchBar(provider: provider),
          ),
        ],
      ),
      body: _isInitialized
          ? Consumer<ChargingStationProvider>(
              builder: (context, chargingStationProvider, _) {
                print(
                    'Retrieved ${chargingStationProvider.stations.length} charging stations');
                if (chargingStationProvider.stations.isEmpty) {
                  // Handle empty data case (display a message, retry logic)
                  return const Center(
                    child: Text('No charging stations found.'),
                  );
                }

                return ListView.builder(
                  itemCount: chargingStationProvider.stations.length,
                  itemBuilder: (context, index) {
                    final station = chargingStationProvider.stations[index];
                    return ChargingStationCard(
                      station: station,
                    );
                  },
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
