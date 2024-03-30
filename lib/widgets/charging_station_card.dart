import 'package:flutter/material.dart';
import 'package:ev_charging_stations_locator_fyp/models/charging_station.dart';

class ChargingStationCard extends StatelessWidget {
  final ChargingStation station;

  const ChargingStationCard({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(
          station.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        station.address,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.location_on),
                      // Consider using NavigationService here if implemented (refer to previous responses)
                      onPressed: () => ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                              content: Text('Navigation not yet available.'))),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                if (station.city.isNotEmpty && station.province.isNotEmpty)
                  Text(
                    '${station.city}, ${station.province}',
                    style: const TextStyle(fontSize: 12),
                  ),

                // * Telephone (if available):
                if (station.telephone.isNotEmpty)
                  Text(
                    'Phone: ${station.telephone}',
                    style: const TextStyle(fontSize: 12),
                  ),

                // * Charger Types (if available):
                if (station.type.isNotEmpty)
                  Text(
                    'Charger types: ${station.type.join(', ')}', // Join list items with comma and space
                    style: const TextStyle(fontSize: 12),
                  ),
                if (station.amenities!.isNotEmpty)
                  Text(
                    'Amenities: ${station.amenities!.join(', ')}', // Join list items with comma and space
                    style: const TextStyle(fontSize: 12),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
