import 'package:ev_charging_stations_locator_fyp/data/station_data.dart';
import 'package:ev_charging_stations_locator_fyp/widgets/charging_station_card.dart';
import 'package:flutter/material.dart';
import 'package:ev_charging_stations_locator_fyp/models/charging_station.dart';

class ChargingStationListScreen extends StatelessWidget {
  const ChargingStationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charging Stations'),
      ),
      body: ListView.builder(
        itemCount: StationData.chargingStations.length,
        itemBuilder: (context, index) {
          final chargingStation = StationData.chargingStations[index];
          return ChargingStationCard(chargingStation: chargingStation);
        },
      ),
    );
  }
}
