import 'package:ev_charging_stations_locator_fyp/models/charging_station.dart';
import 'package:flutter/material.dart';

class ChargingStationCard extends StatelessWidget {
  final ChargingStation chargingStation;

  const ChargingStationCard({super.key, required this.chargingStation});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(chargingStation.name),
        subtitle: Text(chargingStation.address),
        trailing: IconButton(
          icon: const Icon(Icons.map),
          onPressed: () {
            Navigator.pushNamed(context, '/map');
          },
        ),
      ),
    );
  }
}
